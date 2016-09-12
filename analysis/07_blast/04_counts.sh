#!/bin/bash
# short script to get number of tags that had a hit against each of the databases:
for f in `ls *.blast.tsv`
do
	echo $f
	cut -f 1 $f | sort | uniq | wc -l
done | paste - -
