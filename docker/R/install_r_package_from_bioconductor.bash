# install R package from GitHub with remotes
# ex: pimentel/cluster

#R -e "p='$1'; list.of.packages <- c(p); new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])]; if (length(new.packages)) remotes::install_github(p, build_manual=FALSE, build_vignettes=FALSE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"


R -e "p='$1'; list.of.packages <- c(p); new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])]; if (length(new.packages)) remotes::install_bioc(p, build_manual=FALSE, build_vignettes=FALSE);"

