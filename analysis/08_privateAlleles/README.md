Objective is to find alleles specific to comparisons of particular samplings:
For the filtered (~2130) SNPs, identify those present only in:
2012 grassland vs rest
2013 grassland vs rest
Grassland vs Host (I assume host means both cow and human, though it is not labeled this way in spreadsheet)
Cow vs rest
Human vs rest
+/- Rickettsia (all)
+/- Rickettsia each species

A spread sheet of all of these samples was used to generate the appropriate lists, see below:
S_grassland_2012.txt
S_grassland_2013.txt
S_grassland.txt
S_human.txt
S_cow.txt
S_host.txt
S_rickettsia.txt
S_rickettsia_parkeri.txt
S_rickettsia_andeanae.txt
####link vcf file
```
ln -s ../../raw_data_2/UNEAK/distribute/vcftools-filtering/maf01missing90.recode.vcf ./
```
####generate "rest" files (these are simply the inverse of each of the list files)
```
for f in `ls *.txt`
do
base=$(echo $f | cut -f 2- -d '_')
cat $f S_fullList.txt | sort | uniq -u > X_$base
done
```
---
module load python/2.7.11
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_grassland_2012.txt \
--b X_grassland_2012.txt \
--o 2_grassland_2012_vs_rest.txt
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_grassland_2013.txt \
--b X_grassland_2013.txt \
--o 2_grassland_2013_vs_rest.txt
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_grassland.txt \
--b S_host.txt \
--o 2_grassland_vs_host.txt
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_cow.txt \
--b X_cow.txt \
--o 2_cow_vs_rest.txt
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_human.txt \
--b X_human.txt \
--o 2_human_vs_rest.txt
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_rickettsia.txt \
--b X_rickettsia.txt \
--o 2_rickettsia_vs_rest.txt
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_rickettsia_andeanae.txt \
--b X_rickettsia_andeanae.txt \
--o 2_rickettsia_andeanae_vs_rest.txt
python zDev_SNV_pooled.py --i maf01missing90.recode.vcf \
--a S_rickettsia_parkeri.txt \
--b X_rickettsia_parkeri.txt \
--o 2_rickettsia_parkeri_vs_rest.txt
```
---
####just a quick way to summarize counts per comparison
```
for f in `ls 2_*.txt`; do echo $f; cut -f 2,3 -d ' ' $f | sort | uniq -c; done
```
---
PATH=$PATH:/lustre/projects/staton/software/vcftools-0.1.14/bin/
export PERL5LIB=/lustre/projects/staton/software/vcftools-0.1.14/src/perl/
####testing vcf-contrast
```
#A="+"
#sA=""
#B="-"
#sB=""
#for i in `cat S_grassland_2012.txt`
#do
#	A="$A$sA$i"
#	sA=","
#done
#for l in `grep -wvFf S_grassland_2012.txt S_fullList.txt`
#do
#	B="$B$sB$l"
#	sB=","
#done
vcf-contrast --help
#$A $B -n maf01missing90.recode.vcf
```
---
PATH=$PATH:/lustre/projects/staton/software/vcftools-0.1.14/bin/
export PERL5LIB=/lustre/projects/staton/software/vcftools-0.1.14/src/perl/
####testing vcf-contrast
```
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
```
---
