**bioacoust_index**

Bioacoustic Index 

```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

	--min_freq=NUMBER
		miminum frequency to use when calculating the value (default: 2000)

	--max_freq=NUMBER
		maximum frequency to use when calculating the value (default: 8000)

	-f NUMBER, --fft_w=NUMBER
		FFT window to use (default: 512)

	-o CHARACTER, --output=CHARACTER
		output file name [default= bioacoustic_out.tsv]

	-c NUMBER, --cpu=NUMBER
		Number of cores to use (default: 1)

	-h, --help
		Show this help message and exit
```

```
Usage:

bioacoust_index -d SOUNDS_DIRECTORY_PATH [-o OUTPUT.TSV] [-c N_CORES] [-f FFT_window] [--min_freq MIN_FREQ] [--max_freq MAX_FREQ]
```
The arguments between square brackets are optionnal


**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic bioacoust_index -d my_sounds_archive -c 6 -o my_ACI_results.tsv 

occam-run -nnodeXX ofriard/acoustic bioacoust_index -d my_sounds_archive -c 6 --min_freq 1000 --max_freq 15000 -o results.tsv 
```

