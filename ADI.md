**adi**

Acoustic Diversity Index


```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

	-o CHARACTER, --output=CHARACTER
		output file name [default= adi_out.tsv]

	-m NUMBER, --max_freq=NUMBER
		Maximum frequency to use when calculating the value

	-t NUMBER, --db_treshold=NUMBER
		Threshold to use in the calculation (default: -50)

	-b NUMBER, --freq_step=NUMBER
		Size of frequency bands (default: 1000)

	-s NUMBER, --shannon=NUMBER
		Use the Shannon's diversity index to calculate the ADI (default: True)

	-c NUMBER, --cpu=NUMBER
		Number of cores to use (default: 1)

	-h, --help
		Show this help message and exit
    
```

```
Usage:

adi -d SOUNDS_DIRECTORY_PATH -c N_CORES -o OUTPUT.TSV 
```

**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic adi -d my_sounds_archive -c 6 -o my_ACI_results.tsv
```

