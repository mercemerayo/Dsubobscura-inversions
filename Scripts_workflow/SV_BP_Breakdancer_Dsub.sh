#!/bin/bash

# Detect Structural Variants (SVs) and breakpoints using Breakdancer.
# The generated txt file is stored in a separate folder to improve result visibility.

STRAIN=$1
BAM_ALIGNMENT=$2
DSUB_CHR=$3  # RefSeq chromosome code (e.g., NC_048534.1)

mkdir "Breakpoints_${STRAIN}"

echo "Generating configuration file for Breakdancer..."
bam2cfg.pl -g -h "$BAM_ALIGNMENT" > "Breakpoints_${STRAIN}/${STRAIN}_BP_bwamem2.cfg"

echo "Detecting breakpoints in chromosome $DSUB_CHR..."
breakdancer-max -o "Drosophila_subobscura_${DSUB_CHR}" "Breakpoints_${STRAIN}/${STRAIN}_BP_bwamem2.cfg" > "Breakpoints_${STRAIN}/${STRAIN}_breakpoints_bwamem2_${DSUB_CHR}.txt"

