# **Breakpoint Region Analysis: `contigs_search_BP_regions_Dsub.sh`**

## **Overview**
The script `contigs_search_BP_regions_Dsub.sh` extracts, assembles, and analyzes reads from identified breakpoint regions in *Drosophila subobscura*. It processes mapped reads from BAM files, extracts relevant breakpoint-associated reads, and performs de novo assembly to validate chromosomal inversion events.

## **Workflow Summary**
1. **Extraction of reads from breakpoint regions** using `Samtools`. Properly mapped and discordant reads (where one end is mapped, but the other is not) are retrieved separately.
2. **Merging of extracted reads** into a single BAM file and sorting by read name.
3. **Conversion of BAM to FASTQ** to extract forward, reverse, and singleton reads.
4. **Retrieval of unmapped reads** from the original cleaned FASTQ files (after `fastp` processing).
5. **De novo assembly of extracted reads** using `SPAdes` to reconstruct breakpoint-associated sequences.
6. **Alignment of assembled contigs** against the reference genome using `BLAST`.
7. **Filtering of BLAST results** to include only alignments matching the expected chromosome.
8. **Extension of flanking regions by 5Kb** on both sides of the breakpoints to capture complete regions of interest.

## **Input Parameters**
The script requires the following input files:

- **Tab-delimited file** (`FLANKING_WINDOWS_FILE`) containing window names, output directories, and breakpoint coordinates:
 ```bash
  Window_ID  Output_Folder  Chromosome_ID  Proximal_Start  Proximal_End  Distal_Start  Distal_End
```
**Example:**
  ```bash
  win_1  assembly_win_1  NC_048534.1  7772887  7778000  14722000  14727000
  win_2  assembly_win_2  NC_048534.1  8001234  8010000  14567890  14573000
  ```
- **Cleaned Illumina sequencing reads** in FASTQ format (R1_fastq.gz, R2_fastq.gz).

- **Processed BAM file** containing mapped reads.

- **Reference genome** in FASTA format.


## **Usage**
```bash
./contigs_search_BP_regions_Dsub.sh <FLANKING_WINDOWS_FILE> <R1_fastq.gz> <R2_fastq.gz> <BAM_ALIGNMENT> <REFERENCE_GENOME>
```
**Example:**
```bash
./contigs_search_BP_regions_Dsub.sh flanking_windows.txt OF58_R1.fastq.gz OF58_R2.fastq.gz OF58_markdup_bwamem2.bam Drosophila_subobscura_ref_genome.fa
```

## **Requirements**
To run this script, ensure the following tools are installed:

- **`Samtools`**: Processing and manipulation of SAM/BAM files.  
  - Installation: [https://anaconda.org/bioconda/samtools](https://anaconda.org/bioconda/samtools)  

- **`SPAdes`**: De novo genome assembly for breakpoint analysis.  
  - Installation: [https://anaconda.org/bioconda/spades](https://anaconda.org/bioconda/spades)  

- **`BLAST`**: Alignment of contigs to the reference genome.  
  - Installation: [https://anaconda.org/bioconda/blast](https://anaconda.org/bioconda/blast)  

## **Manuals and References**
For further details on each tool, refer to the official documentation:

- **`Samtools`**: [https://www.htslib.org/doc/samtools.html](https://www.htslib.org/doc/samtools.html)  
- **`SPAdes`**: https://home.cc.umanitoba.ca/~psgendb/doc/spades/manual.html 
- **`BLAST`**: https://www.animalgenome.org/bioinfo/resources/manuals/blast2.2.24/user_manual.pdf 
