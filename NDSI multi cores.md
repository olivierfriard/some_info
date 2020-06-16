**ndsi_multi**

Normalized Difference Soundscape Index (no check for short files)

```
Options:

  -d CHARACTER, --directory=CHARACTER
		sounds directory path

	-o CHARACTER, --output=CHARACTER
		output file name [default= ndsi_out.tsv]

	-f NUMBER, --fft_w=NUMBER
		FFT window to use (default: 1024)

	--anthro_min=NUMBER
		minimum value of the range of frequencies of the anthrophony (default: 1000)

	--anthro_max=NUMBER
		maximum value of the range of frequencies of the anthrophony (default: 2000)

	--bio_min=NUMBER
		minimum value of the range of frequencies of the biophony (default: 2000)

	--bio_max=NUMBER
		maximum value of the range of frequencies of the biophony (default: 11000)

	-c NUMBER, --cpu=NUMBER
		Number of cores to use

	-h, --help
		Show this help message and exit


```


```
Usage:

ndsi_multi -d SOUNDS_DIRECTORY_PATH [-c N_CORES] [-o OUTPUT.TSV] [--bio_min NUMBER] [--bio_max NUMBER] [--anthro_min NUMBER] [--anthro_max NUMBER]
```

The arguments between square brackets are optionnal. If missing the default values will be used.


**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic ndsi_multi -d my_sounds_archive -c 6 -o my_NDSI_results.tsv  

occam-run -nnodeXX ofriard/acoustic ndsi_multi -d my_sounds_archive -c 6 -o my_NDSI_results.tsv  --anthro_min MIN  --anthro_max MAX --bio_min MIN --bio_max MAX

```
