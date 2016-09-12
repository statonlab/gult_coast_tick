#!/bin/bash
# reformat vcf file into a format useable by plink
/lustre/projects/staton/software/plink_1.9/plink \
--vcf maf01missing90.recode.vcf --make-bed --out maf01mis90
# run plink LD analysis 
/lustre/projects/staton/software/plink_1.9/plink \
--bfile maf01mis90 \
--r2 \
--ld-window-r2 0.2 \
--matrix


#--ld-window 100000 \
#--ld-window-kb 100000 \
