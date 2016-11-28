library(LDna)
library(genetics)

# change to correct directory containing LDMat.txt
# LDMat.txt produced by running plink's ld analysis see: 6b_plinkLD on Staton
# some extra formatting was done to make the file readable by LDna (replace nan with 0.05)
setwd("~/29_becky")

# read data into table and format into lower tri matrix
LDmat <- read.table("LDMat.txt", header = F)
LDmat <- data.matrix(LDmat)
#LDmat[upper.tri(LDmat, diag = FALSE)] <- NA
LDmat[upper.tri(LDmat, diag = TRUE)] <- NA

# read labels and add them
lbls  <- read.table("lbls.txt", header = F)
row.names(LDmat) <- unlist(lbls)
colnames(LDmat)  <- unlist(lbls)

# looks good?
LDmat

# feed into LDna
ldna <- LDnaRaw(LDmat)

# examine network
png("01_network_0.6.png", width = 10, height = 10, units = 'in', res = 100)
    plotLDnetwork(LDmat=LDmat, option=1, threshold=0.6)
dev.off()

# 3-5 phi
# check phi of 3.
png("02_clusters_me6_p3.png", width = 10, height = 10, units = 'in', res = 100)
    par(mfcol=c(1,2))
    clustersPhi3 <- extractClusters(ldna, min.edges = 6, phi = 3, rm.COCs = FALSE, plot.tree = TRUE)
dev.off()

# 3-5 phi
# check phi of 4.
png("02_clusters_me6_p4.png", width = 10, height = 10, units = 'in', res = 100)
    par(mfcol=c(1,2))
    clustersPhi4 <- extractClusters(ldna, min.edges = 6, phi = 4, rm.COCs = FALSE, plot.tree = TRUE)
dev.off()

# file summary
summaryPhi3 <- summaryLDna(ldna, clustersPhi3, LDmat)
write.csv(as.data.frame(summaryPhi3),
          file="03_summaryPhi3.csv")

### VIEW COC IN NETWORK ###
png("TEST.png", width = 10, height = 10, units = 'in', res = 100)
  par(mfcol=c(13,3))
  plotLDnetwork(ldna, LDmat, option=2, clusters=clustersPhi3, summary=summaryPhi3)
dev.off()

# file summary
summaryPhi4 <- summaryLDna(ldna, clustersPhi4, LDmat)
write.csv(as.data.frame(summaryPhi4),
          file="03_summaryPhi4.csv")

# save cluster contents to file using sink
sink("04_clustersPhi3.txt", append=FALSE, split=FALSE)
clustersPhi3
sink()

# save cluster contents to file using sink
sink("04_clustersPhi4.txt", append=FALSE, split=FALSE)
clustersPhi4
sink()

# constellations phi3
library(parallel)
setwd("~/29_becky/05_networkPhi3")
fun <- function(x){
  setEPS()
  postscript(paste("05_networkPhi3", x, "eps",  sep="."))
  plotLDnetwork(ldna, LDmat, option=2, clusters=clustersPhi3[x], summary=summaryPhi3[x,], full.network=FALSE)
  dev.off()
}
lapply(1:length(clustersPhi3), fun)

# constellations for phi4
setwd("~/29_becky/05_networkPhi4")
fun <- function(x){
  setEPS()
  postscript(paste("05_networkPhi4", x, "eps",  sep="."))
  plotLDnetwork(ldna, LDmat, option=2, clusters=clustersPhi4[x], summary=summaryPhi4[x,] full.network=FALSE)
  dev.off()
}
lapply(1:length(clustersPhi4), fun)

# write "deathstars" only for phi3
library(parallel)
setwd("~/29_becky/06_networkPhi3_deathstar")
fun <- function(x){
  setEPS()
  postscript(paste("06_networkPhi3_deathstar", x, "eps",  sep="."))
  plotLDnetwork(ldna, LDmat, option=2, clusters=clustersPhi3[x], summary=summaryPhi3[x,], threshold=0.6, full.network=TRUE)
  dev.off()
}
lapply(1:length(clustersPhi3), fun)
