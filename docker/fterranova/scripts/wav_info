#!/usr/bin/python3

"""
check wav file with wave module
"""

import sys
import wave
import numpy as np

def wav_info(wav_file):
    wav = wave.open(wav_file, "r")
    frames = wav.readframes(-1)

    frame_rate = wav.getframerate()
    wav.close()

    sound_info = np.frombuffer(frames, dtype=np.int16)

    init_count = 0
    for i in sound_info:
        if i == 0:
            init_count += 1
        else:
            break

    final_count = 0
    for idx in range(len(sound_info) - 1, 0, -1):
        if sound_info[idx] == 0:
            final_count += 1
        else:
            break

    return {"file_name":wav_file,
            "frame_rate": frame_rate,
            "sample_width": wav.getsampwidth()*8,
            "n_channels": wav.getnchannels(),
            "duration": len(sound_info) / frame_rate,
            "initial_silence": init_count / frame_rate,
            "final_silence": final_count / frame_rate}


if len(sys.argv) < 2:
    print("No arguments")
    sys.exit() 

print((f"File name\t"
       f"Frame rate\t"
       f"Sample width\t"
       f"Number of channels\t"
       f"Duration (s):\t"
       f"Initial silence duration (s)\t"
       f"Final silence duration (s)"))


for wav_file in sys.argv[1:]:

    r = wav_info(wav_file)
    print((f"{r['file_name']}\t"
           f"{r['frame_rate']}\t"
           f"{r['sample_width']}\t"
           f"{r['n_channels']}\t"
           f"{r['duration']}\t"
           f"{r['initial_silence']}\t"
           f"{r['final_silence']}"))
