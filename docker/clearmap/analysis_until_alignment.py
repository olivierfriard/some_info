# %% Initialize workspace
import sys

sys.path.append('/ClearMap2')
from ClearMap.Environment import *  # analysis:ignore
import scipy.io
import numpy as np
import numpy.lib.recfunctions as rfn
import os
import argparse
import yaml
from yaml import Loader
import time
from ClearMap.Scripts.functions_CellMap import *

##############################################################################
# Initialization of parameters

with open("ClearMap/Scripts/configfile.yaml", 'r') as stream:
    config = yaml.load(stream, Loader=Loader)

data_directory = config['data_directory']
source_res = config['source_res']
sink_res = config['sink_res']
orientation = tuple(config['orientation'])
slice_x = config['slice_x']
slice_y = config['slice_y']
slice_z = config['slice_z']
shape_param = config['shape_param']
shape_detection_threshold = config['shape_detection_threshold']
source = config['source']
size = config['size']
method = config['method']
radius = tuple(config['radius'])
rerun = config['rerun_alignment']
debug_detection = config['debug_detection']
align_to = config['align_to']

# Create test data and debug
slicing = (slice_x, slice_y, slice_z)
thresholds_filt = {
    'source': source,
    'size': size
}


if type(config['subjects']) == str:
    subject = config['subjects']
    print('Running analysis only on one subject')
elif type(config['subjects']) == list:
    parser = argparse.ArgumentParser(description='subject')
    parser.add_argument('subject', metavar='subject', type=str,
    help='mouse which is analyzed in batch file')
    args = parser.parse_args()
    subject = args.subject
else:
    raise TypeError('Wrong input subject parameter')


# include the subject in the data directory
data_directory = data_directory + subject + '/'
            
            
# make directories needed for project
if not os.path.exists(data_directory):
    os.makedirs(data_directory)
for folder in ['elastix_auto_to_reference', 
               'elastix_resampled_to_auto', 
               'elastix_resampled_to_reference']:
    if not os.path.exists(data_directory+folder):
        os.makedirs(data_directory+folder)
        
        
# Workspace initialization
expression_raw = 'cFos/stitched_fused_tp_0_ch_0.tif'
# expression_raw = 'cFos/Z<Z,4> .tif'
expression_auto = 'Auto/Z<Z,4> .tif'

ws = wsp.Workspace('CellMap', directory=data_directory)
ws.update(raw=expression_raw, autofluorescence=expression_auto)
ws.info()
ws.debug = False

###########################################################################


# creation resources directory
resources_directory = settings.resources_path


# convertion of data to numpy
convert_data_to_numpy(ws=ws, 
                      directory=data_directory, rerun=rerun)


## resampling of cfos file
resampling(ws=ws, 
           source_res=source_res, 
           sink_res=sink_res,
           align_to=align_to, 
           directory=data_directory)


## alignment of resampled to reference
alignment(ws=ws, 
          alignment_files_directory=resources_directory, 
          align_to=align_to, 
          orientation=orientation,
          directory=data_directory, 
          slicing=slicing,
          rerun=rerun)
        #   rerun=rerun)
