
options(Ncpus=20)


install.packages("remotes")

remotes::install_bioc("dada2", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")
remotes::install_bioc("Biostrings", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")
remotes::install_bioc("phyloseq", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")

remotes::install_cran("vegan", dependencies=T, build_manual=FALSE, build_vignettes=FALSE);
remotes::install_bioc("microbiome", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")


dplyr
writexl
xlsx
readxl
tidyr
tibble
remotes::install_bioc("microbiomeMarker", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")
remotes::install_bioc("microbiomeutilities", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")
remotes::install_bioc("microeco", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")
remotes::install_bioc("MicrobiotaProcess", build_manual=FALSE, build_vignettes=FALSE, upgrade="always")

