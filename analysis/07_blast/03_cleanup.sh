#!/bin/bash
# script to clean up results of blast searches
cat GulfCoastTickUNEAK.topm.fasta.*.bt_alt_Btau_5.0.1.fa.blast > GCT_UNEAK_Btau_5.0.1.blast.tsv
cat GulfCoastTickUNEAK.topm.fasta.*.hs_ref_GRCh38.p7.fa.blast > GCT_UNEAK_hs_GTCh38.blast.tsv
cat GulfCoastTickUNEAK.topm.fasta.*.Rparkeri_NC_017044.1.fa.blast > GCT_UNEAK_Rparkeri_NC_017044.1.blast.tsv
rm -f *.blast
