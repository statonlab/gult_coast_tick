#!/bin/bash
for file in `ls *.vcf`
do
base=$(echo $file | cut -f 1 -d '_')

echo "#$ -N x${base}
#$ -q short*
#$ -cwd
#$ -o $base.o
#$ -e $base.e
/lustre/projects/staton/software/plink_1.9/plink \
--vcf $file --make-bed --out ${base}_maf01mis90 
/lustre/projects/staton/software/plink_1.9/plink \
--bfile ${base}_maf01mis90 \
--r2 \
--ld-window-r2 0.2 \
--out ${base} \
--matrix" > job.ogs
qsub job.ogs
rm -f job.ogs

done
