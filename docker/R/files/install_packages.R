# install packages from packages_list.txt file

install.packages("remotes")

p = read.delim("/packages_list.txt", header=FALSE)

for (i in seq_along(p$V1))
    {
    if(!require(p$V1[i], character.only=TRUE))
        {

        if (grepl('local:', p$V1[i]))  # local package  ex: "local:Boruta_8.0.0.tar.gz Boruta"
            {
            package_file_name = strsplit(p$V1[i], ':')[[1]][2]        # -> Boruta_8.0.0.tar.gz Boruta
            package_file = strsplit(package_file_name, ' ')[[1]][1]   # -> Boruta_8.0.0.tar.gz
            package_name = strsplit(package_file_name, ' ')[[1]][2]   # -> Boruta

            print(paste0('install from local copy: ', package_file))
            remotes::install_local(paste0('/', package_file) , build_manual=FALSE, build_vignettes=FALSE)

            # test
            library(package_name, character.only=TRUE)
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
            print(paste0('testing installation of ', p$V1[i]))
            library(p$V1[i], character.only=TRUE)
            }

        }

    }


if (!requireNamespace("BiocManager", quietly=TRUE)) install.packages("BiocManager")
BiocManager::install(c("phyloseq"))


