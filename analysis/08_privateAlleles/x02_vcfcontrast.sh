#!/bin/bash
PATH=$PATH:/lustre/projects/staton/software/vcftools-0.1.14/bin/
export PERL5LIB=/lustre/projects/staton/software/vcftools-0.1.14/src/perl/
# testing vcf-contrast
A="+"
sA=""
B="-"
sB=""
for i in `cat S_grassland_2012.txt`
do
	A="$A$sA$i"
	sA=","
done
for l in `grep -wvFf S_grassland_2012.txt S_fullList.txt`
do
	B="$B$sB$l"
	sB=","
done

vcf-contrast $A $B -f maf01missing90.recode.vcf
