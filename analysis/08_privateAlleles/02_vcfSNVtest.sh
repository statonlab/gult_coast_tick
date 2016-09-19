#!/bin/bash
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
