**praat_cc**

Apply to all WAV files of the specified directory

```
Cross-correlation with Praat

optional arguments:
  -h, --help            show this help message and exit
  -d DIRECTORY, --directory DIRECTORY
                        Set directory of WAVE files
  -c CPU, --cpu CPU     Set number of CPU/cores to use (default 1)
  -o OUTPUT, --output OUTPUT
                        Set path for the output file
  -v, --version         show program's version number and exit
  -i INITIAL_SILENCE, --initial-silence INITIAL_SILENCE
                        indicate the silence duration (in s) at the beginning
                        of the sound
  -f FINAL_SILENCE, --final-silence FINAL_SILENCE
                        indicate the silence duration (in s) at the end of the
                        sound
```

```
Usage:

praat_cc -d SOUNDS_DIRECTORY_PATH -c N_CORES -o OUTPUT.TSV
```

**Examples of use**

```
occam-run -nnodeXX ofriard/acoustic praat_cc -d my_sounds_archive -c 6 -o my_results.tsv
```
or
```
occam-run -nnodeXX ofriard/acoustic praat_cc --directory my_sounds_archive --cpu 6 --output my_results.tsv
```

In case of silenced WAV files (0.5 s of silence at the beginning and 0.5 s at the end):

```
occam-run -nnodeXX ofriard/acoustic praat_cc -d my_sounds_archive -c 6 -i 0.5 -f 0.5 -o out.tsv
```
or

```
occam-run -nnodeXX ofriard/acoustic praat_cc --directory my_sounds_archive --cpu 6 --initial-silence 0.5 --final-silence 0.5 -o out.tsv
```



