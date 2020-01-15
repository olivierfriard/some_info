Sounds distances matrix with DTwave

```
Sounds distances with DTwave

optional arguments:
  -h, --help            show this help message and exit
  -d DIRECTORY, --directory DIRECTORY
                        Set directory of WAVE files
  -c CPU, --cpu CPU     Set number of CPU/cores to use (default 1)
  -k HTK_CONFIG, --htk_config HTK_CONFIG
                        HTK configuration file
  -w DTWAVE_PATH, --dtwave_path DTWAVE_PATH
                        Set path for dtwave prog
  -o OUTPUT, --output OUTPUT
                        Set path for the output file
  -v, --version         show program's version number and exit
```

```
usage: 
dtwave_dist -d DIRECTORY [-c CPU] [-k HTK_CONFIG] [-w DTWAVE_PATH] [-v]
```

**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic dtwave_dist -d my_sounds_archive -c 6 -k config_htk
```
If no output is specified, the results will be saved in a file with a name based on the directory name (my_sounds_archive.distances.tsv in the above example).



Specifying an output file:

```
occam-run -nnodeXX ofriard/acoustic dtwave_dist -d my_sounds_archive -c 6 -k config_htk -o my_dtw_results.tsv
```
