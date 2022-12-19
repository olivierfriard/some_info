install.packages('remotes')


remotes::install_local('/Require_0.1.4.tar.gz', dependencies=T)

remotes::install_local('/SpaDES.tools_1.0.0.tar.gz', dependencies=T)

# NetLogoR
#remotes::install_cran('microbenchmark')
remotes::install_local('/fastshp_0.1-2.tar.gz', dependencies=T)
#remotes::install_cran('matrixStats')
#remotes::install_cran('abind')

remotes::install_local('/NetLogoR_0.3.11.tar.gz', dependencies=F)

remotes::install_local('/pedantics_1.7.tar.gz', dependencies=T)
