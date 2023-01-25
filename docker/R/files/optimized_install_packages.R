install.packages("remotes")

p = read.delim("/packages_list.txt", header=FALSE)

for(i in seq_along(p$V1)) { if(!require(p$V1[i], character.only=TRUE)) { remotes::install_cran(p$V1[i]); }}

# from github
remotes::install_github("swager/randomForestCI")
remotes::install_github("Cdevenish/hardRain")
remotes::install_github("nagydavid/RDaisy",subdir = "RDaisy")

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c("phyloseq"))


