**aci_seewave**

Acoustic Complexity Index from the Seewave package

```
Options:
	-d CHARACTER, --directory=CHARACTER
		Sounds directory path

	-o CHARACTER, --output=CHARACTER
		Output file name [default= aci_out.tsv]

	--min_freq=NUMBER
		miminum frequency to use when calculating the value (in KHz) (default: NULL)

	--max_freq=NUMBER
		maximum frequency to use when calculating the value (in KHz) (default: NULL)

	-w NUMBER, --wl=NUMBER
		Window length [default= 512]

	--channel=NUMBER
		channel left: 1 right: 2 [default= 1]

	--ovlp=NUMBER
		overlap between two successive windows (in %) [default= 0]

	-h, --help
		Show this help message and exit

```

```
Usage:

aci_seewave -d SOUNDS_DIRECTORY_PATH [-o OUTPUT.TSV] [--channel CHANNEL] [-w WINDOW_LENGTH] [--min_freq MIN_FREQ] [--max_freq MAX_FREQ]
```
The arguments between square brackets are optionnal


**Examples of use on OCCAM**

```
occam-run -nnodeXX ofriard/acoustic aci_seewave -d my_sounds_archive --channel 1 --o my_ACI_results.tsv 

occam-run -nnodeXX ofriard/acoustic aci_seewave -d my_sounds_archive --channel 2 --min_freq 1 --max_freq 15 -o my_ACI_results.tsv 
```

