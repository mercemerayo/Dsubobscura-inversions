# Detection of chromosomal inversions in *Drosophila subobscura*

## Overview

The aim of this GitHub repository is to provide a bioinformatics pipeline for detecting chromosomal inversions in *Drosophila subobscura* using whole-genome sequencing (WGS) data. This pipeline performs read quality control, mapping, structural variant detection, and breakpoint identification.

The workflow follows these main steps:

1. Hologenome assembly: The hologenome is built using reference genomes of symbionts and pathogens.
2. Quality control and filtering: Using fastp, raw Illumina reads are filtered to remove low-quality sequences.
3. Read mapping: Reads are aligned to the hologenome using bwa-mem2.
4. SAM/BAM processing: The mapped reads undergo post-processing with samtools (sorting, fixing mates, removing duplicates, and indexing).
5. Structural variant detection: Structural variants and breakpoints are identified using Breakdancer.
6. Filtering and analysis of inversions: The results are analyzed to determine potential chromosomal inversions.
