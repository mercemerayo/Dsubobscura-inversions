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
