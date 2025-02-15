## **Workflow Summary**

This pipeline follows these main steps:

1. **Quality Control**: Filtering and trimming of raw Illumina reads using `fastp`.  
   - **Script:** [`fastp_quality_ctrl_clean.sh`](fastp_quality_ctrl_clean.sh)  
   - **Command:**
     ```bash
     bash fastp_quality_ctrl_clean.sh <STRAIN_ID> <R1_fastq.gz> <R2_fastq.gz>
     ```

2. **Read Mapping**: Aligning reads to the *Drosophila subobscura* hologenome using `bwa-mem2`.  
   - **Script:** [`Map_bwamem2_hologenome_Dsub.sh`](Map_bwamem2_hologenome_Dsub.sh)  
   - **Command:**
     ```bash
     bash Map_bwamem2_hologenome_Dsub.sh <HOLOGENOME.fasta> <STRAIN_ID> <R1_fastq.gz> <R2_fastq.gz> <LIBRARY> <PLATFORM_UNIT>
     ```

3. **BAM Processing**: Sorting, duplicate removal, and indexing using `samtools`.  
   - **Script:** [`Process_SAM_BAM_dup_removed.sh`](Process_SAM_BAM_dup_removed.sh)  
   - **Command:**
     ```bash
     bash Process_SAM_BAM_dup_removed.sh <STRAIN_ID> <SAM_FILE>
     ```

4. **Structural Variant Detection**: Identification of breakpoints and structural variants using `Breakdancer`.  
   - **Script:** [`SV_BP_Breakdancer_Dsub.sh`](SV_BP_Breakdancer_Dsub.sh)  
   - **Command:**
     ```bash
     bash SV_BP_Breakdancer_Dsub.sh <STRAIN_ID> <BAM_FILE> <CHROMOSOME>
     ```

Each step generates key output files that contribute to detecting chromosomal inversions in *Drosophila subobscura*.

## **Requirements**
To run this pipeline, ensure the following tools are installed:

- **`fastp`**: Quality control and filtering of sequencing reads.  
  - Installation: [https://anaconda.org/bioconda/fastp](https://anaconda.org/bioconda/fastp)  

- **`bwa-mem2`**: Mapping reads to the reference genome.  
  - Installation: [https://anaconda.org/bioconda/bwa-mem2](https://anaconda.org/bioconda/bwa-mem2)  

- **`Samtools`**: Processing and manipulation of SAM/BAM files.  
  - Installation: [https://anaconda.org/bioconda/samtools](https://anaconda.org/bioconda/samtools)  

- **`Breakdancer`**: Detection of structural variants and breakpoints.  
  - Installation: [https://anaconda.org/bioconda/breakdancer](https://anaconda.org/bioconda/breakdancer)  

- **`SPAdes`**: De novo genome assembly for breakpoint analysis.  
  - Installation: [https://anaconda.org/bioconda/spades](https://anaconda.org/bioconda/spades)  

- **`BLAST`**: Alignment of contigs to the reference genome.  
  - Installation: [https://anaconda.org/bioconda/blast](https://anaconda.org/bioconda/blast)  


## **Manuals and References**
For further details on each tool, refer to the official documentation:

- **`fastp`**: [https://github.com/OpenGene/fastp](https://github.com/OpenGene/fastp)  
- **`bwa-mem2`**: [https://github.com/bwa-mem2/bwa-mem2](https://github.com/bwa-mem2/bwa-mem2)  
- **`Samtools`**: [https://www.htslib.org/doc/samtools.html](https://www.htslib.org/doc/samtools.html)  
- **`Breakdancer`**: https://github.com/genome/breakdancer
- **`SPAdes`**: https://home.cc.umanitoba.ca/~psgendb/doc/spades/manual.html 
- **`BLAST`**: https://www.animalgenome.org/bioinfo/resources/manuals/blast2.2.24/user_manual.pdf 


