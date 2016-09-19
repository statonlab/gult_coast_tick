#!/bin/bash
# just a quick way to summarize counts per comparison
for f in `ls 2_*.txt`; do echo $f; cut -f 2,3 -d ' ' $f | sort | uniq -c; done
