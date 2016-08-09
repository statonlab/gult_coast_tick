#!/bin/bash
# reformat vcf file into a format useable by plink
/lustre/projects/staton/software/plink_1.9/plink \
--vcf maf01missing50.recode.vcf --make-bed --out maf01mis50
# run plink LD analysis 
/lustre/projects/staton/software/plink_1.9/plink \
--bfile maf01mis50 --r2 \
--ld-window 100000 \
--ld-window-kb 100000 \
--ld-window-r2 0.2
