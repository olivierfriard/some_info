**h_multi**

Total Entropy (from Seewave package) (multi cores)

```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

	-o CHARACTER, --output=CHARACTER
		output file name [default= out.txt]

        --channel NUMBER
	        audio channel [default= 1] (left channel)

        -w NUMBER, --wl
	        window length
		
	--envt CHARACTER
	        the type of envelope to be used: either "abs" for absolute amplitude envelope or "hil" for Hilbert amplitude 

	-c NUMBER, --cpu=NUMBER
		Number of cores to use

	-h, --help
		Show this help message and exit
```


**Usage**
```
h_multi -d SOUNDS_DIRECTORY_PATH -c N_CORES -o OUTPUT.TSV
```

**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic h_multi -d my_sounds_archive -c 6 -o my_H_results.tsv

occam-run -nnodeXX ofriard/acoustic h_multi -d my_sounds_archive -c 6 -o my_H_results.tsv --envt abs --channel 2
```
