install.packages("remotes")

p = read.delim("/packages_list.txt", header=FALSE)


for (i in seq_along(p$V1)) { if(!require(p$V1[i], character.only=TRUE)) {  remotes::install_cran(p$V1[i], dependencies=T); }}

remotes::install_github("swager/randomForestCI")

remotes::install_bioc("phyloseq")


