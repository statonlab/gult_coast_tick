#!/bin/bash
module load bwa
bwa mem \
-t 20 \
Ixodes_scapularis.fasta \
GCT_C952TANXX_5.fastq > GCT_C952TANXX_5.sam
