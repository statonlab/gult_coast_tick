####create links to important files
```
ln -s ../../raw_data_2/UNEAK/GulfCoastTickUNEAK.topm.fasta ./
ln -s ../../raw_data_2/Reference/bt_alt_Btau_5.0.1/* ./
ln -s ../../raw_data_2/Reference/hs_alt_CHM1_1.1/* ./
ln -s ../../raw_data_2/Reference/Rparkeri_NC_017044.1/* ./
ln -s /lustre/projects/staton/unpublished_lab_code/perl/fasta_scripts/split.pl ./
```
---
####script for running blast jobs
```
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
```
---
####script to clean up results of blast searches
```
cat GulfCoastTickUNEAK.topm.fasta.*.bt_alt_Btau_5.0.1.fa.blast > GCT_UNEAK_Btau_5.0.1.blast.tsv
cat GulfCoastTickUNEAK.topm.fasta.*.hs_ref_GRCh38.p7.fa.blast > GCT_UNEAK_hs_GTCh38.blast.tsv
cat GulfCoastTickUNEAK.topm.fasta.*.Rparkeri_NC_017044.1.fa.blast > GCT_UNEAK_Rparkeri_NC_017044.1.blast.tsv
rm -f *.blast
```
---
####short script to get number of tags that had a hit against each of the databases:
```
for f in `ls *.blast.tsv`
do
	echo $f
	cut -f 1 $f | sort | uniq | wc -l
done | paste - -
```
---
