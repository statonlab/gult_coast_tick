#!/bin/bash
# script for running blast jobs
for f in `ls splits`
do
	for i in bt_alt_Btau_5.0.1.fa hs_ref_GRCh38.p7.fa Rparkeri_NC_017044.1.fa
	do
		echo "#$ -N $f.$i
#$ -cwd
#$ -o ./ogs_output.txt
#$ -e ./ogs_error.txt
module load blast
blastn \\
-db $i \\
-query ./splits/$f \\
-evalue 0.0001 \\
-outfmt 6 \\
-max_target_seqs 1 \\
-out $f.$i.blast" > job.ogs
qsub job.ogs
rm -f job.ogs
	done
done
