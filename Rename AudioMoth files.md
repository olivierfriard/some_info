**Rename AudioMoth files**

```
rename_audiomoth_files

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
occam-run -nnodeXX ofriard/acoustic rename_audiomoth_files -d sounds_archive -t 3
```

