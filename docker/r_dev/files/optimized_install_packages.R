p = read.delim("/packages_list.txt", header=FALSE)

for(i in seq_along(p$V1)) { if(!require(p$V1[i], character.only=TRUE)) { install.packages(p$V1[i]); }}


if(!require("devtools", character.only=TRUE)) install.packages("devtools")
library("devtools")
devtools::install_github("swager/randomForestCI")
devtools::install_github("https://github.com/Cdevenish/hardRain")

if (!require("BiocManager", character.only=TRUE)) install.packages("BiocManager")
BiocManager::install(c("phyloseq"))


