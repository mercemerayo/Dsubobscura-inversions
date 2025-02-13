#!/bin/bash

# Processing SAM/BAM files from the mapping (alignment) of OF28 reads using samtools
STRAIN=$1
SAM_ALIGNMENT=$2

echo "Converting SAM to BAM..."
samtools view -b "$SAM_ALIGNMENT" -o "${STRAIN}_mapped_bwamem2.bam"

echo "Grouping reads by name..."
samtools collate -o "${STRAIN}_collated.bam" "${STRAIN}_mapped_bwamem2.bam"

echo "Fixing mate pair information..."
samtools fixmate -m "${STRAIN}_collated.bam" "${STRAIN}_fixmate.bam"

echo "Sorting BAM by coordinates..."
samtools sort -o "${STRAIN}_sorted.bam" "${STRAIN}_fixmate.bam"

echo "Marking and removing duplicates..."
samtools markdup -r "${STRAIN}_sorted.bam" "${STRAIN}_markdup_bwamem2.bam"

echo "Indexing BAM file without duplicates..."
samtools index "${STRAIN}_markdup_bwamem2.bam"

# Remove intermediate files to save storage space
rm -f "${STRAIN}_mapped_bwamem2.bam" "${STRAIN}_collated.bam" "${STRAIN}_fixmate.bam" "${STRAIN}_sorted.bam"

# Generate final BAM statistics
echo "Generating statistics for the final BAM file..."
samtools flagstat "${STRAIN}_markdup_bwamem2.bam" > "${STRAIN}_stats_markdup.txt"
