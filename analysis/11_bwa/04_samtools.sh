#!/bin/bash
# convert to bam/sort
module load samtools
samtools view -b GCT_C952TANXX_5.sam | samtools sort > GCT_C952TANXX_5.bam
