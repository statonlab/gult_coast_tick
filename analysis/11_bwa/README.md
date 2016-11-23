Ixodes scapularis strain Wikel colony 1108463063928, whole genome shotgun sequence obtained from NCBI on 22 November 2016
####link important files
```
ln -s ../../raw_data_2/UNEAK/distribute/GCT_C952TANXX_5.fastq ./
```
---
module load bwa
bwa index Ixodes_scapularis.fasta
```
---
module load bwa
bwa mem \
-t 20 \
Ixodes_scapularis.fasta \
GCT_C952TANXX_5.fastq > GCT_C952TANXX_5.sam
```
---
####convert to bam/sort
```
module load samtools
samtools view -b GCT_C952TANXX_5.sam | samtools sort > GCT_C952TANXX_5.bam
```
---
####create sequence dictionary
```
module load java/jdk8u5
java -jar /lustre/projects/staton/software/picard-tools-2.1.0/picard.jar CreateSequenceDictionary \
R=Ixodes_scapularis.fasta \
O=Ixodes_scapularis.bam
```
####run picard tools to get stats
```
java -jar /lustre/projects/staton/software/picard-tools-2.1.0/picard.jar CollectAlignmentSummaryMetrics \
INPUT=GCT_C952TANXX_5.bam \
R=Ixodes_scapularis.fasta \
OUTPUT=GCT_C952TANXX_5.stats.txt
```
---
