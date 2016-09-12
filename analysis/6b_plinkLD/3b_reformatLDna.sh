#!/bin/bash
# script to create formatted files for the R package LDna
sed 's/nan/0.05/g' plink.ld > LDMat_alter.txt
cut -f 2 maf01mis90.bim > lbls.txt
