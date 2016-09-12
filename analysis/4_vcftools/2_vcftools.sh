#!/bin/bash
# run genetics calculations for Becky
for param in "--het" "--singletons" "--freq" "--hardy" "--TajimaD 1" "--TsTv-summary" " --TsTv 1"
do
/lustre/projects/staton/software/vcftools-0.1.14/bin/vcftools --vcf maf01missing50.recode.vcf $param
done
grep -v "0  0$" out.TsTv > out.TsTv.fix
grep -v "nan" out.Tajima.D > out.Tajima.D.fix
