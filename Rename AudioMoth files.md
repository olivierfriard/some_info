**Rename AudioMoth files**

```
rename_audiomoth_files

Rename audiomoth files with metadata

optional arguments:
  -h, --help            show this help message and exit

   -d DIRECTORY, --directory DIRECTORY
                        Set directory of WAVE files
  -r, --recurse         recurse sub-directories

   -t TIMEZONE, --timezone TIMEZONE
                        Add/subtract time (in decimal hours)
   -s, --serial-number   Add AudioMoth serial number to WAV file

   -p PREFIX, --prefix PREFIX
                        Text to add at the beginning og the new filename

```

```
Usage:

rename_audiomoth_files -d SOUNDS_DIRECTORY_PATH -t HOURS -r -s -p PLACE_

```

**Examples of use on OCCAM**

```
occam-run -nnode10 ofriard/acoustic rename_audiomoth_files -d sounds_archive -t 3
```
This example will rename the audiomoth files adding 3 hours to the codified date/time

```
occam-run -nnode10 ofriard/acoustic rename_audiomoth_files -d sounds_archive -p maromiza_
```
This example will rename the audiomoth files and add 'maromiza_' as a prefix for each file name

