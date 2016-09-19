library(LDna)
library(genetics)

# as run on local system
# change to correct directory
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

# png("05_networkPhi3.png", width = 10, height = 10, units = 'in', res = 100)
#   par(mfcol = c(8, 3))
#   summaryPhi3 <- summaryLDna(ldna, clusters = clustersPhi3, LDmat)
#   plotLDnetwork(ldna, LDmat, option = 2, clusters = clustersPhi3, 
#                 summary = summaryPhi3, full.network = FALSE, 
#                 include.parent = FALSE, after.merger = FALSE)
# dev.off()
# 
# setwd("~/29_becky/05_networkPhi4")
# png("05_networkPhi4.png", width = 10, height = 10, units = 'in', res = 100)
#   par(mfcol = c(4, 3))
#   summaryPhi4 <- summaryLDna(ldna, clusters = clustersPhi4, LDmat)
#   plotLDnetwork(ldna, LDmat, option = 2, clusters = clustersPhi4, 
#                 summary = summaryPhi4, full.network = FALSE, 
#                 include.parent = FALSE, after.merger = FALSE)
# dev.off()
# 
# setwd("~/29_becky/05_networkPhi3")
# png("05_networkPhi3.png", width = 10, height = 10, units = 'in', res = 100)
# par(mfcol = c(4, 3))
# summaryPhi4 <- summaryLDna(ldna, clusters = clustersPhi3, LDmat)
# plotLDnetwork(ldna, LDmat, option = 2, clusters = clustersPhi3, 
#               summary = summaryPhi4, full.network = FALSE, 
#               include.parent = FALSE, after.merger = FALSE)
# dev.off()




library(parallel)
setwd("~/29_becky/05_networkPhi3")
fun <- function(x){
  setEPS()
  postscript(paste("05_networkPhi3", x, "eps",  sep="."))
  plotLDnetwork(ldna, LDmat, option=2, clusters=clustersPhi3[x], summary=summaryPhi3[x,], full.network=FALSE)
  dev.off()
}
lapply(1:length(clustersPhi3), fun)

setwd("~/29_becky/05_networkPhi4")
fun <- function(x){
  setEPS()
  postscript(paste("05_networkPhi4", x, "eps",  sep="."))
  plotLDnetwork(ldna, LDmat, option=2, clusters=clustersPhi4[x], summary=summaryPhi4[x,], full.network=FALSE)
  dev.off()
}
lapply(1:length(clustersPhi4), fun)


