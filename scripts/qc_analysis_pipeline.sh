#!/usr/bin/env bash

# Map bash arguments to local variables
SESSION=$1
T1=$2
T2=$3
DMRI=$4

WORK_DIR=/home/docker/work-dir

# Derive instrument ID and date from session id
SUBJECT=${SESSION%_*}
INSTRUMENT=${SUBJECT#*_}
DATE=${SESSION##*_}

# Get script dir
SCRIPT_DIR=$(dirname $0)

# Run the analysis script
python $SCRIPT_DIR/qc_analysis.py $XNAT_HOST \
                                  --phantom t1_32ch "$T1" \
                                  --phantom t2_32ch "$T2" \
                                  --phantom dmri_32ch "$DMRI" \
                                  --dates "$DATE" \
                                  --instrument "$INSTRUMENT" \
                                  --work_dir "$WORK_DIR" \
                                  --auth $XNAT_USER $XNAT_PASS
                                  
                                  