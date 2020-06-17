#!/usr/bin/Rscript


# Total entropy

# read sounds directory as argument
# example: h -d /home/sounds -o ndsi.tsv -c 2

library("optparse")
library("soundecology")
library("seewave")

option_list = list(

    make_option(c("-d", "--directory"), type="character", default=NULL, 
                help="sounds directory path", metavar="character"),

    make_option(c("-o", "--output"), type="character", default="h_out.tsv", 
                help="output file name [default= %default]", metavar="character"),

    make_option(c("--channel"), type="integer", default=1, 
                help="channel left: 1 right: 2 [default= %default]", metavar="number"),


    make_option(c("-e", "--envt"), type="character", default="hil", 
                help=" Type of envelope (default: hil)", metavar="character"),

    make_option(c("-w", "--wl"), type="integer", default=512, 
                help="window length for spectral entropy analysis [default= %default]",
                metavar="number"),


    make_option(c("-c", "--cpu"), type="integer", default=1, 
                help="Number of cores to use [default= %default]", metavar="number")
); 
 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$directory)){
  print_help(opt_parser)
  stop("You must supply a directory", call.=FALSE)
}


multiple_sounds(directory=opt$directory,
                resultfile=opt$output,
                soundindex="H",
                channel=opt$channel,
                envt=opt$envt,
                wl=opt$wl,
                no_cores=opt$cpu)


