#TCGA DATA minging @xiaoman 2017 version = 0.1

library("ggplot2")
library("tidyr")
library("dplyr")

setwd("G:/xiaoman.Data/R/TCGA")
breast <- read.csv( file.choose(), header = T)
lung <- read.csv( file.choose(), header = T)
colon <- read.csv( file.choose(), header = T)
liver <- read.csv( file.choose(), header = T)
esophage <- read.csv( file.choose(), header = T)
bladder <- read.csv( file.choose(), header = T)

breast <- mutate(breast,type="Breast")
lung <- mutate(lung,type="Lung")
colon <- mutate(colon,type="Colon")
liver <- mutate(liver,type="Liver")
esophage <- mutate(esophage,type="Esophage")
bladder <- mutate(bladder,type="Bladder")

seq.data <- bind_rows(breast,lung,colon,liver,esophage,bladder)

p <- ggplot(data=seq.data,mapping= aes(x= sample_type, y=mRNAseq, fill=type))
p1 <- p + geom_jitter(alpha=0.2,size=1)+
geom_boxplot(alpha=0.6) +
facet_wrap(~type,nrow = 1)+
xlab("Sample Type") +
ylab("NEU1 mRNA Level (Log2)")
p1 + theme(axis.text.x = element_text(angle=30, vjust=1, hjust = 1))

write.csv(seq.data,file = "TCGA.NEU1.mRNAseq.csv")
