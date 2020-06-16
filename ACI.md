**aci**

Acoustic Complexity Index with check for short files

Analysis will run on a single core

```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

        --pattern
	        pattern for selecting files (default: *.wav)

        --min_freq=NUMBER
		miminum frequency to use when calculating the value (default: NA)

	--max_freq=NUMBER
		maximum frequency to use when calculating the value (default: NA)

	-f NUMBER, --fft_w=NUMBER
		FFT window to use (default: 512)

	-o CHARACTER, --output=CHARACTER
		output file name [default= aci_out.tsv]

	-h, --help
		Show this help message and exit
```

```
Usage:

aci -d SOUNDS_DIRECTORY_PATH [--pattern "*.wav"] [-o OUTPUT.TSV] [-c N_CORES] [-f FFT_window] [--min_freq MIN_FREQ] [--max_freq MAX_FREQ]
```

The arguments between square brackets are optionnal. If missing the default values will be used.


**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic aci -d my_sounds_archive --pattern *.WAV -o my_ACI_results.tsv 

occam-run -nnodeXX ofriard/acoustic aci -d my_sounds_archive --min_freq 1000 --max_freq 15000 -o my_ACI_results.tsv 
```

