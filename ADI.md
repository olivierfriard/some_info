**adi**

Acoustic Diversity Index


```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

	-o CHARACTER, --output=CHARACTER
		output file name [default= adi_out.tsv]

	-m NUMBER, --max_freq=NUMBER
		Maximum frequency to use when calculating the value (default: 10000)

	-t NUMBER, --db_treshold=NUMBER
		Threshold to use in the calculation (default: -50)

	-b NUMBER, --freq_step=NUMBER
		Size of frequency bands (default: 1000)

	-s NUMBER, --shannon=NUMBER
		Use the Shannon's diversity index to calculate the ADI (default: True)

	-h, --help
		Show this help message and exit
    
```

**Usage**
```
adi -d SOUNDS_DIRECTORY_PATH [-o OUTPUT.TSV] [-m MAX_FREQ] 
```
The arguments between square brackets are optionnal


**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic adi -d my_sounds_archive -o my_ADI_results.tsv

occam-run -nnodeXX ofriard/acoustic adi -d my_sounds_archive -o my_ADI_results.tsv --shannon FALSE
```

