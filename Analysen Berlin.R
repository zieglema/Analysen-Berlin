#setwd("/Volumes/Macintosh HD 2/HU-Box/Meine Bibliothek/Projekte extern/ANIT/Analysen Berlin")

library(foreign)
anit <- read.spss("ALLINT_(N=684)_[29.07.2016].sav", to.data.frame = T, use.missings = T, use.value.labels = F)
head(anit)
names(anit)
library(psych)
descs <- describe(anit)
descs
library(openxlsx)
write.xlsx(descs, "descs.xlsx", asTable = T)
table(anit$sample)

#Analyseplan:
#Messmodelle nur mit vollständigen Daten, aber FIML
#Strukturmodelle anhand der FS
#Evtl. EFA anhand der FS
#Omegas und alphas

names(anit)
anit_r <- anit[c(1:9, 107:206)]
handNames <- grep(pattern = "hand", x=names(anit_r), value=T)
alpha(anit_r[handNames], check.keys = F)
