#!/bin/bash
java -Xmx1024m -Xms512m -jar /lustre/projects/staton/software/PGDSpider_2.1.0.3/PGDSpider2-cli.jar \
-inputfile all.filtered.recode.vcf \
-inputformat vcf \
-outputfile all.filt.ars \
-outpuformat ARLEQUIN \
-spid all.filt.spid
