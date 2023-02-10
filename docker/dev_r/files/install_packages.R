install.packages("remotes")

p = read.delim("/packages_list.txt", header=FALSE)

for (i in seq_along(p$V1))
    {
    if(!require(p$V1[i], character.only=TRUE))
        {

	if (grepl('tar.gz', p$V1[i]))  # local package
            {
            print(paste0('install from local copy: ', p$V1[i]))
            remotes::install_local(paste0('/', p$V1[i]) , build_manual=FALSE, build_vignettes=FALSE)  
            }

        else if (grepl('/', p$V1[i]))  # from github
            {
            print(paste0('install from github: ', p$V1[i]))
            remotes::install_github(p$V1[i], build_manual=FALSE, build_vignettes=FALSE); 
            }

        else
            {
            print(paste0('install from CRAN: ', p$V1[i]))
            remotes::install_cran(p$V1[i], dependencies=T, build_manual=FALSE, build_vignettes=FALSE);

            # test
            library(p$V1[i], character.only=TRUE)

            }
        }


    }




