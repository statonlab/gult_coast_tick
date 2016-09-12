#!/bin/bash
java -Xmx1024m -Xms512m -jar /lustre/projects/staton/software/PGDSpider_2.1.0.3/PGDSpider2-cli.jar \
-inputfile shuffle.vcf \
-inputformat vcf \
-outputfile shuffle_01.arp \
-outpuformat ARLEQUIN \
-spid shuffle_01.spid
