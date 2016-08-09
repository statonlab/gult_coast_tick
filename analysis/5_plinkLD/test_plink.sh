#!/bin/bash
#/lustre/projects/staton/software/plink_1.9/plink \
#--vcf sub.vcf --make-bed --out test
/lustre/projects/staton/software/plink_1.9/plink \
--bfile test --r2 \
--ld-window-r2 0.2
