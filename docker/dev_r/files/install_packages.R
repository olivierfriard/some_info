# instal R packages from a list in packages_list.txt using remotes

local({
  r <- getOption("repos")
  r["CRAN"] <- "http://cran.mirror.garr.it/mirrors/CRAN/"
  options(repos = r)
})


install.packages("remotes")

p = read.delim("/packages_list.txt", header=FALSE)

for (i in seq_along(p$V1))
    {
    if(!require(p$V1[i], character.only=TRUE))
        {

	if (grepl('local:', p$V1[i]))  # local package
            {
            package_file_name = strsplit(p$V1[i], ':')[[1]][2]        # -> Boruta_8.0.0.tar.gz Boruta
            package_file = strsplit(package_file_name, ' ')[[1]][1]   # -> Boruta_8.0.0.tar.gz
            package_name = strsplit(package_file_name, ' ')[[1]][2]   # -> Boruta

            print(paste0('install from local copy: ', package_file))
            remotes::install_local(paste0('/', package_file) , build_manual=FALSE, build_vignettes=FALSE)

            # test
            print(paste0('testing installation of ', package_name))
            library(package_name, character.only=TRUE)
            }

        else if (grepl('github:', p$V1[i]))  # from github  (github:foo/bar bar)
            {

            package_file_name = strsplit(p$V1[i], ':')[[1]][2]        
            package_file = strsplit(package_file_name, ' ')[[1]][1]   
            package_name = strsplit(package_file_name, ' ')[[1]][2]  

            print(paste0('install from github: ', package_file))
            remotes::install_github(package_file, build_manual=FALSE, build_vignettes=FALSE); 

            # test
            print(paste0('testing installation of ', package_name))
            library(package_name, character.only=TRUE)
            }

        else if (grepl('bioconductor:', p$V1[i]))  # from BioConductor  (bioconductor:foo foo)
            {

            package_file_name = strsplit(p$V1[i], ':')[[1]][2]        # 
            package_file = strsplit(package_file_name, ' ')[[1]][1]   # 
            package_name = strsplit(package_file_name, ' ')[[1]][2]   # 

            print(paste0('install from BioConductor: ', package_file))
            remotes::install_bioc(package_file, build_manual=FALSE, build_vignettes=FALSE);

            # test
            print(paste0('testing installation of ', package_name))
            library(package_name, character.only=TRUE)
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




