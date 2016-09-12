#!/bin/bash
# script to create formatted files for the R package LDna
sed 's/nan/0/g' 4a.ld > 4a_LDMat.txt
cut -f 2 4a_maf01mis90.bim > 4a_lbls.txt
sed 's/nan/0/g' 4b.ld > 4b_LDMat.txt
cut -f 2 4b_maf01mis90.bim > 4b_lbls.txt
sed 's/nan/0/g' 4c.ld > 4c_LDMat.txt
cut -f 2 4c_maf01mis90.bim > 4c_lbls.txt
