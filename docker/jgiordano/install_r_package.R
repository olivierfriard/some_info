#!/usr/bin/env Rscript
# install_and_load_makeflags_linux.R
# Linux-only script for use in Docker builds or CI.
# Installs and loads one or more R packages, sets MAKEFLAGS=-jN for parallel compilation,
# and optionally persists that change to ~/.R/Makevars (with backup).
#
# Designed to be non-interactive and suitable to run during a Docker build:
#  - sets a CRAN mirror automatically if none is configured
#  - uses parallel::detectCores() to set Ncpus and MAKEFLAGS
#  - writes ~/.R/Makevars only if --write-makevars is passed (useful in images)
#
# IMPORTANT: this script does NOT install system-level build dependencies
# (e.g. libxml2-dev, libcurl4-openssl-dev, build-essential). In Dockerfiles,
# install required OS packages (apt-get install ...) before invoking this script.
#
# Usage (example in Dockerfile):
#   COPY install_and_load_makeflags_linux.R /usr/local/bin/
#   RUN Rscript /usr/local/bin/install_and_load_makeflags_linux.R --write-makevars pkg1 pkg2
#
# Exit codes:
#   0  - success
#   2  - incorrect usage (no package names)
#  10  - unable to load package after installation
#  11  - install failed
#  12  - failure writing ~/.R/Makevars

args <- commandArgs(trailingOnly = TRUE)

# Minimal option parsing: presence of --write-makevars toggles persistent Makevars writing.
write_makevars <- FALSE
if (length(args) == 0) {
  message("Usage: Rscript install_and_load_makeflags_linux.R <package1> [package2 ...] [--write-makevars]")
  quit(status = 2)
}
if ("--write-makevars" %in% args) {
  write_makevars <- TRUE
  args <- setdiff(args, "--write-makevars")
}
pkgs <- args
if (length(pkgs) == 0) {
  message("Usage: Rscript install_and_load_makeflags_linux.R <package1> [package2 ...] [--write-makevars]")
  quit(status = 2)
}

# Ensure a CRAN mirror is set (important for non-interactive Docker/CI runs).
if (is.null(getOption("repos")) || identical(getOption("repos")["CRAN"], "@CRAN@")) {
  options(repos = c(CRAN = "https://cran.rstudio.com/"))
}

# Detect number of CPU cores for parallel installation/compilation (fallback to 1).
ncpus <- tryCatch({
  n <- parallel::detectCores(logical = TRUE)
  if (is.na(n) || n < 1) 1L else as.integer(n)
}, error = function(e) 1L)
message("Detected CPU cores: ", ncpus)

# Set MAKEFLAGS in the current process environment so child make processes use -jN.
makeflags_val <- paste0("-j", ncpus)
Sys.setenv(MAKEFLAGS = makeflags_val)
message("MAKEFLAGS set for this session: ", Sys.getenv("MAKEFLAGS"))

# Function to write ~/.R/Makevars (Linux-only), with a timestamped backup if file exists.
write_makevars_file <- function(makeflags, backup = TRUE) {
  rdir <- path.expand("~/.R")
  if (!dir.exists(rdir)) {
    if (!dir.create(rdir, recursive = TRUE, showWarnings = FALSE)) {
      stop("Unable to create directory ", rdir)
    }
  }
  mf <- file.path(rdir, "Makevars")
  if (file.exists(mf) && backup) {
    ts <- format(Sys.time(), "%Y%m%dT%H%M%S")
    bak <- paste0(mf, ".bak.", ts)
    if (!file.copy(mf, bak, overwrite = TRUE)) {
      stop("Failed to backup existing Makevars to ", bak)
    }
    message("Existing Makevars backed up to: ", bak)
  }
  existing <- if (file.exists(mf)) readLines(mf, warn = FALSE) else character(0)
  # remove any existing MAKEFLAGS lines to avoid duplicates
  kept <- existing[!grepl("^\\s*MAKEFLAGS\\s*=", existing, perl = TRUE)]
  new_content <- c(kept, paste0("MAKEFLAGS = ", makeflags))
  tmp <- tempfile(pattern = "Makevars")
  writeLines(new_content, tmp)
  if (!file.copy(tmp, mf, overwrite = TRUE)) {
    stop("Unable to write Makevars to ", mf)
  }
  message("MAKEFLAGS written to: ", mf)
  invisible(TRUE)
}

# If requested, persist MAKEFLAGS to ~/.R/Makevars (fail with code 12 on error)
if (write_makevars) {
  tryCatch({
    write_makevars_file(makeflags_val, backup = TRUE)
  }, error = function(e) {
    message("ERROR: failed to write ~/.R/Makevars: ", conditionMessage(e))
    quit(status = 12)
  })
}

# Ensure remotes is available; install non-interactively if needed.
ensure_remotes <- function() {
  if (!requireNamespace("remotes", quietly = TRUE)) {
    message("Installing 'remotes' from CRAN...")
    # use repos from options(); non-interactive
    install.packages("remotes", repos = getOption("repos"))
    if (!requireNamespace("remotes", quietly = TRUE)) {
      stop("'remotes' could not be installed")
    }
  }
}

# Use ncpus for remotes::install_cran's Ncpus argument (parallel install of multiple packages)
ncpus_for_install <- ncpus

# Loop over requested packages: install if missing, then load.
for (pkg in pkgs) {
  pkg <- as.character(pkg)
  if (pkg == "" || is.na(pkg)) next

  message("==> Processing package: ", pkg)

  if (!requireNamespace(pkg, quietly = TRUE)) {
    message("Package '", pkg, "' not found — installing (Ncpus=", ncpus_for_install, ") ...")
    tryCatch({
      ensure_remotes()
      # install with remotes::install_cran to honor your previous choices (no vignettes/manual)
      remotes::install_cran(pkg,
                            dependencies = TRUE,
                            build_manual = FALSE,
                            build_vignettes = FALSE,
                            Ncpus = ncpus_for_install)
    }, error = function(e) {
      message("ERROR: install failed for package '", pkg, "': ", conditionMessage(e))
      quit(status = 11)
    })
  } else {
    message("Package '", pkg, "' already installed.")
  }

  # Attempt to load the package (suppress startup messages); exit 10 on failure to load.
  loaded <- tryCatch({
    suppressPackageStartupMessages(
      require(pkg, character.only = TRUE, quietly = TRUE)
    )
  }, error = function(e) FALSE)

  if (!isTRUE(loaded)) {
    message("ERROR: unable to load package '", pkg, "' after installation.")
    quit(status = 10)
  }

  message("OK: package '", pkg, "' installed and loaded successfully.")
}

message("All requested packages processed successfully.")
quit(status = 0)
