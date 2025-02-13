#!/bin/bash

# Index and align reads using bwa-mem2 with the D. subobscura hologenome
HOLOGENOME=$1
STRAIN=$2
SEQ_NGS_R1=$3
SEQ_NGS_R2=$4
LIBRARY=$5
PLUNIT=$6

# Index the hologenome
echo "Indexing the hologenome with bwa-mem2..."
bwa-mem2 index "$HOLOGENOME"

# Align (map) reads to the hologenome and generate a SAM file
echo "Aligning reads to the hologenome..."
bwa-mem2 mem -t 4 -M -R '@RG\tID:D1EFBACXX_${STRAIN}\tPL:ILLUMINA\tLB:${LIBRARY}\tPU:${PLUNIT}\tSM:${STRAIN}' "$HOLOGENOME" "$SEQ_NGS_R1" "$SEQ_NGS_R2"
 > ${STRAIN}_aligned_hologenome_dsub.sam

