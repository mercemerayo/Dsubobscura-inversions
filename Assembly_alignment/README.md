## **Overview**
The script `contigs_search_BP_regions_Dsub.sh` extracts, assembles, and analyzes reads from identified breakpoint regions in *Drosophila subobscura*. 

## **Workflow Summary**
1. **Extraction of reads from breakpoint regions** using `Samtools`.
2. **Retrieval of discordant reads** where one end is mapped, but the other is not.
3. **Merging of properly mapped and discordant reads** into a single BAM file.
4. **De novo assembly of reads** using `SPAdes`.
5. **Alignment of assembled contigs to the reference genome** using `BLAST`.
6. **Filtering of BLAST results** to identify breakpoint regions.
7. **Extension of flanking regions** by 5Kb to ensure full region capture.

## **Usage**
```bash
bash contigs_search_BP_regions_Dsub.sh <FLANKING_WINDOWS_FILE> <R1_fastq.gz> <R2_fastq.gz> <BAM_ALIGNMENT> <REFERENCE_GENOME>
```
