#!/bin/bash
ln -s ../../raw_data_2/UNEAK/distribute/all.vcf ./
ln -s /lustre/projects/staton/software/VCF2Arlequin/VCF2Arlequin.py ./
ln -s /lustre/projects/staton/software/VCF2Arlequin/arlsumstat_linux/ ./
ln -s /lustre/projects/staton/software/VCF2Arlequin/ssdefs.txt ./
ln -s /lustre/projects/staton/software/VCF2Arlequin/
#if [ "1" = "1" ]; then
grep "^#CHROM" all.vcf | cut -f 10- | sed 's/\t/\t1\n/g' | sed '$ d' > listpop
#grep "^#CHROM" all.vcf | cut -f 10- | sed 's/\t/\n/g' | cut -f 1 -d 'A' | cut -f 1 -d 'W' | sed '$ d'
#fi
