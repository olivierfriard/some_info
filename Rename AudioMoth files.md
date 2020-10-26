**Rename AudioMoth files**

```
rename_audiomoth_files

Arguments:

  -h, --help                    Show this help message and exit

  -d DIRECTORY, --directory DIRECTORY
                                Directory of WAV files to be renamed

  -t HOURS, --timezone HOURS    Add/subtract time (in decimal hours)
  
  -r, --recurse                 Recurse sub-directories

  -s, --serial-number           Add AudioMoth serial number to WAV files

```

```
Usage:

rename_audiomoth_files -d SOUNDS_DIRECTORY_PATH -t HOURS -r -s
```

**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic rename_audiomoth_files -d sounds_archive -t 3
```
This example will rename the audiomoth files adding 3 hours to the codified date/time
