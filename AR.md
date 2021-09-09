**ar**

Acoustic Richness (Seewave)

```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

	-o CHARACTER, --output=CHARACTER
		output file name [default= out.txt]

        -e CHARACTER, --envt=CHARACTER
	        Type of envelope (default: hil)

	-c NUMBER, --cpu=NUMBER
		Number of cores to use

	-h, --help
		Show this help message and exit
```


**Usage**
```
ar -d SOUNDS_DIRECTORY_PATH -c N_CORES -o OUTPUT.TSV
```

**Examples of use on OCCAM**
```
occam-run -nnodeXX ofriard/acoustic ar -d my_sounds_archive -c 6 -o my_AR_results.tsv

occam-run -nnodeXX ofriard/acoustic ar -d my_sounds_archive -c 6 -o my_AR_results.tsv --envt hil
```

