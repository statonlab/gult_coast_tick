#!/bin/bash
# create sequence dictionary
module load java/jdk8u5
java -jar /lustre/projects/staton/software/picard-tools-2.1.0/picard.jar CreateSequenceDictionary \
R=Ixodes_scapularis.fasta \
O=Ixodes_scapularis.bam
# run picard tools to get stats
java -jar /lustre/projects/staton/software/picard-tools-2.1.0/picard.jar CollectAlignmentSummaryMetrics \
INPUT=GCT_C952TANXX_5.bam \
R=Ixodes_scapularis.fasta \
OUTPUT=GCT_C952TANXX_5.stats.txt
