#!/bin/bash
# link vcf file
ln -s ../../raw_data_2/UNEAK/distribute/vcftools-filtering/maf01missing90.recode.vcf ./
# generate "rest" files (these are simply the inverse of each of the list files)
for f in `ls *.txt`
do
base=$(echo $f | cut -f 2- -d '_')
cat $f S_fullList.txt | sort | uniq -u > X_$base
done
