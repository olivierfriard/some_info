**ndsi**

Normalized Difference Soundscape Index with check for short files

Analysis will run on a single core

```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

        --pattern
	        pattern for selecting files (default: *.wav)

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

	-h, --help
		Show this help message and exit


```


```
Usage:

ndsi -d SOUNDS_DIRECTORY_PATH [--pattern "*.wav"] [-o OUTPUT.TSV]

```

**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic ndsi -d my_sounds_archive -c 6 -o my_NDSI_results.tsv  

occam-run -nnodeXX ofriard/acoustic ndsi -d my_sounds_archive -c 6 -o my_NDSI_results.tsv  --anthro_min MIN  --anthro_max MAX --bio_min MIN --bio_max MAX

```
