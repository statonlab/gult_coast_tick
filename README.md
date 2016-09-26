Analysis of variants in gulf coast tick beetles for Becky.

#Methods

###Library preparation and sequencing

###Alignment to other species
Genomes for *H. Sapien* GRCh38, *R. parkeri* NC_017044.1, and *B. Taurus* Btau_5.0.1 were obtained from the National Center for Biotechnolgys website and were used to generate databases for BLAST queries (http://www.ncbi.nlm.nih.gov/). UNEAK tag pairs were extracted from Tassel results and converted into fasta format. The UNEAK tags were used as queries against each of the genomes.

###SNP analysis
Single nucleotide variants (SNVs) were identified in the reference-free Genotyping by Sequencing (GBS) pipeline, UNEAK (http://www.maizegenetics.net/tassel). These analyses were prepared by Qi Sun from the Cornell genomics group. Further analysis of the SNVs included filtering using a more stringent max-missing cutoff of 0.90 in VCFtools v0.1.14 (http://vcftools.sourceforge.net/). VCFtools was also used to calculaate singletons, allele frequency, Hardy-Weinberg Equilibrium p-values for each site, Tajimas D (bin 1), transisiton / transversion ratio, and heterozygosity on an individual basis. SNVs were extracted into PLINK format and PLINK v1.9 was utilized to calculate linkage disequilibrium (LD) among all loci (http://pngu.mgh.harvard.edu/~purcell/plink/). 

###Network analysis of loci in linkage disequilibrium
The Linkage Disequlibrium Network Analsysis (LDna) package in R was used to identify clusters of loci with high LD (https://github.com/petrikemppainen/LDna). Graphs and summary statistics were generated with phis of 3 and 4 and a minimum number of edges of 6. The basis for these parameters were chosen on inspection of the LD network and thresh holding graphs generated using the LDna package. 

###Comparison of alleles among tick populations
In order to assess differences among SNVs across groups of populations we combined the SNV calls of each locus of a group to a single call per locus. We then compared these combined calls between groups of interest. The following is a list of each of the comparisons: grassland 2012 vs all, grassland 2013 vs all, grassland vs host, cow vs all, human vs all, Rickettsia (all species) vs all, R. parkeri vs all, and R. andeanae vs all. A script written in python was used to make these comparisons and it can be found here: https://github.com/statonlab/gult_coast_tick/tree/master/analysis/08_privateAlleles. 

###ADMIXUTRE
Calculation of P and Q values was performed useing the ADMIXTURE software (https://www.genetics.ucla.edu/software/admixture/index.html)
