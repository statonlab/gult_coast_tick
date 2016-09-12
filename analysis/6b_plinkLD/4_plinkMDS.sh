#!/bin/bash
# generate plink genome
/lustre/projects/staton/software/plink_1.9/plink \
--bfile maf01mis90 \
--genome --noweb 
# use plink to generate the md plots (cluster on 4)
/lustre/projects/staton/software/plink_1.9/plink \
--bfile maf01mis90 \
--read-genome plink.genome --mds-plot 4 --cluster
