p = read.delim("/packages_list.txt", header=FALSE)

install.packages("remotes")


for (i in seq_along(p$V1)) { if(!require(p$V1[i], character.only=TRUE)) {  remotes::install_cran(p$V1[i]); }}

remotes::install_github("swager/randomForestCI")
remotes::install_github("Cdevenish/hardRain")

remotes::install_bioc("phyloseq")

#for(i in seq_along(p$V1)) { if(!require(p$V1[i], character.only=TRUE)) { install.packages(p$V1[i]); }}
#
#if(!require("devtools", character.only=TRUE)) install.packages("devtools")
#library("devtools")
#devtools::install_github("swager/randomForestCI")
#devtools::install_github("https://github.com/Cdevenish/hardRain")
#
#if (!require("BiocManager", character.only=TRUE)) install.packages("BiocManager")
#BiocManager::install(c("phyloseq"))


