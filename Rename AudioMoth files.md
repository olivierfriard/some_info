**rename_audiomoth_files**

```
Rename AudioMoth files

Arguments:

  -h, --help            Show this help message and exit

  -d DIRECTORY, --directory DIRECTORY
                        Directory of WAV files to be renamed

  -t, --timezone        Add/subtract time (in decimal hours)
  
  -r, --recurse         Recurse sub-directories


```

```
Usage:

rename_audiomoth_files -d SOUNDS_DIRECTORY_PATH -c N_CORES -o OUTPUT.TSV
```

*Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic freq_bin -d sounds_archive -o results.tsv 
```

In case of silenced WAV files (0.5 s of silence at the beginning and 0.5 s at the end):

```
occam-run -nnodeXX ofriard/acoustic freq_bin -d sounds_archive -i 0.5 -f 0.5 -o out.tsv 
```
or

```
occam-run -nnodeXX ofriard/acoustic freq_bin --directory my_sounds_archive --initial-silence 0.5 --final-silence 0.5 -o out.tsv
```
