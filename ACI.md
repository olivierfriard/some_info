**aci**

Acoustic Complexity Index

```
Options:
	-d CHARACTER, --directory=CHARACTER
		sounds directory path

	-o CHARACTER, --output=CHARACTER
		output file name [default= out.txt]

	-c NUMBER, --cpu=NUMBER
		Number of cores to use

	-h, --help
		Show this help message and exit
```

```
Usage:

aci -d SOUNDS_DIRECTORY_PATH -c N_CORES -o OUTPUT.TSV 
```

**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic aci -d my_sounds_archive -c 6 -o my_ACI_results.tsv
```

