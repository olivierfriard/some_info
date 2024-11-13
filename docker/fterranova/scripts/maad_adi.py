"""
compute the ADI with scikit-maad

to emulate ADI results from soundecology set db_threshold to -50
"""

import sys
import os
import pathlib as pl

from maad import sound, features

import argparse
import pandas as pd
import scipy as sp
import numpy as np
from functools import partial


def ADI_soundecology(param: tuple) -> tuple:

    file_name, db_threshold = param

    wave, fs = sound.load(str(file_name), detrend=False)
    N = 2048

    fn, tn, Sxx_complex = sp.signal.spectrogram(
        wave,
        fs,
        window="hamming",
        nperseg=int(fs / 10),
        noverlap=0,
        nfft=int(fs / 10),
        mode="complex",
        detrend=None,
        scaling="density",
        axis=-1,
    )

    # convert complex spectrogram into spectro
    Sxx_complex = Sxx_complex * np.sqrt(2 * (fs / 2200))
    Sxx = abs(Sxx_complex)

    adi = features.acoustic_diversity_index(
        Sxx, fn, fmin=0, fmax=10000, bin_step=1000, dB_threshold=db_threshold, index="shannon"
    )

    print(f"{file_name.name} done", file=sys.stderr)
    return (file_name.name, db_threshold, adi)


def main():

    parser = argparse.ArgumentParser(
        prog="maad-adi",
        usage="\nmaad_adi -d SOUNDS_DIRECTORY_PATH [-p 'PATTERN'] [-c NUMBER_OF_CPU] -o OUTPUT",
        description="ADI with Scikit-maad multiprocessing",
    )
    parser.add_argument(
        "-d", "--directory", required=True, action="store", dest="directory", help="Set directory of WAVE files"
    )

    parser.add_argument("-o", "--output", action="store", dest="output", help="Set path for the output file")

    parser.add_argument(
        "-t",
        "--db_threshold",
        required=True,
        action="store",
        type=int,
        default=-50,
        dest="db_threshold",
        help="Set DB threshold",
    )

    parser.add_argument(
        "-p",
        "--pattern",
        action="store",
        dest="pattern",
        default="*.wav",
        type=str,
        help="Set pattern for WAV file selection (default is *.wav)",
    )
    parser.add_argument(
        "-c", "--cpu", action="store", dest="cpu", default=1, type=int, help="Set number of cores to use (default 1)"
    )
    args = parser.parse_args()

    if not args.directory:
        print("Sounds directory not found!")
        sys.exit(3)

    file_name_list = [x for x in pl.Path(args.directory).glob(args.pattern)]

    print(f"\nProcessing {len(file_name_list)} files with {args.cpu} core(s)...\n", file=sys.stderr)

    # header
    header = ["file name", "DB threshold", "ADI"]
    out = "\t".join(header) + "\n"

    if args.cpu > 1:
        import concurrent.futures

        with concurrent.futures.ProcessPoolExecutor(max_workers=args.cpu) as executor:
            results = executor.map(ADI_soundecology, zip(file_name_list, [args.db_threshold] * len(file_name_list)))

        for result in sorted(results):
            if result:
                out += "\t".join([str(x) for x in result]) + "\n"
    else:
        for file_name in sorted(file_name_list):
            out += "\t".join([str(x) for x in ADI_soundecology((file_name, args.db_threshold))]) + "\n"

    if args.output:
        try:
            with open(args.output, "w") as f_out:
                f_out.write(out)
        except Exception:
            print(f"\nError saving results in {args.output}.\nFile {args.directory}.tsv created.", file=sys.stderr)
            with open(f"{args.directory}.tsv", "w") as f_out:
                f_out.write(out)

    else:
        print(out)


main()
