####create links to the PLINK file
```
ln -s ../6b_plinkLD/*.bed ./
ln -s ../6b_plinkLD/*.bim ./
ln -s ../6b_plinkLD/*.fam ./
```
---
####run admixture with basic parameters
```
/lustre/projects/staton/software/admixture_linux-1.3.0/admixture maf01mis90.bed 3
```
---
