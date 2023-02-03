install.packages("remotes")

p = read.delim("/packages_list.txt", header=FALSE)

for (i in seq_along(p$V1))
    {
    if(!require(p$V1[i], character.only=TRUE))
        {

	if (p$V1[i] == 'Boruta')
            {
            remotes::install_local('/Boruta_8.0.0.tar.gz' , build_manual=FALSE, build_vignettes=FALSE)  
            }
        else
            {
            remotes::install_cran(p$V1[i], dependencies=T, build_manual=FALSE, build_vignettes=FALSE); 
            }
        }
    }




