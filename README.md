Analysis of variants in gulf coast tick beetles for Becky.

#Methods

###Library preperation and sequencing

###Alignment to other species
Genomes for *H. Sapien* GRCh38, *R. parkeri* NC_017044.1, and *B. Taurus* Btau_5.0.1 were obtained from the National Center for Biotechnolgys website and were used to generate databases for BLAST queries (http://www.ncbi.nlm.nih.gov/). UNEAK tag pairs were extracted from Tassel results and converted into fasta format. The UNEAK tags were used as queries against each of the genomes.

####SNP analysis
Single nucleotide variants (SNVs) were identified in the reference-free Genotyping by Sequencing (GBS) pipeline, UNEAK (http://www.maizegenetics.net/tassel). These analyses were prepared by Qi Sun from the Cornell genomics group. Further analysis of the SNVs included filtering using a more stringent max-missing cutoff of 0.90 in VCFtools v0.1.14. VCFtools was also used to calculaate singletons, allele frequency, Hardy-Weinberg Equilibrium p-values for each site, Tajimas D (bin 1), transisiton / transversion ratio, and heterozygosity on an individual basis. SNVs were extracted into PLINK format and PLINK v1.9 was utilized to calculate linkage disequilibrium (LD) among all loci. 

####Network analysis of loci in linkage disequilibrium
The Linkage Disequlibrium Network Analsysis (LDna) package in R was used to identify clusters of loci with high LD (https://github.com/petrikemppainen/LDna). 

