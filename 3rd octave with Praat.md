**3rd_octave**

```
3rd octave with Praat

Arguments:

  -h, --help            show this help message and exit

  -d DIRECTORY, --directory DIRECTORY
                        Set directory of WAVE files

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

3rd_octave -d SOUNDS_DIRECTORY_PATH -c N_CORES -o OUTPUT.TSV
```

*Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic 3rd_octave -d my_sounds_archive -o my_results.tsv
```

In case of silenced WAV files (0.5 s of silence at the beginning and 0.5 s at the end):

```
occam-run -nnodeXX ofriard/acoustic 3rd_octave -d my_sounds_archive -i 0.5 -f 0.5 -o out.tsv
```
or

```
occam-run -nnodeXX ofriard/acoustic 3rd_octave --directory my_sounds_archive --initial-silence 0.5 --final-silence 0.5 -o out.tsv
```
