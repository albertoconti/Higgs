# Clear Workspace
rm(list = ls(all = TRUE))
# Set Default Directory
setwd("~/Documents/Astronomy/Higgs/")

#Load libraries
library("ggplot2")
source("http://bioconductor.org/biocLite.R")
biocLite("geneplotter")
library("geneplotter")

#Load file
massH <- read.table("Higgs.csv",header=T,sep=",")
names(massH)

lim <- 500

massH <- subset(massH, massH$mass < lim, select=c(Pub,mass,merror))
time <- massH$Pub
higgs <- massH$mass
err <- massH$merror
# Define the top and bottom of the errorbars 
limits <- aes(ymax = higgs+err, ymin=higgs-err) 

ggplot(massH,aes(time,higgs)) + 
  stat_density2d(aes(fill = ..level..),geom="polygon")

ggplot(massH,aes(higgs))  + geom_density(colour="darkblue",fill="blue",alpha = 0.2) +
  opts(title="Higgs Boson Mass Measurements") + 
  xlab("Higgs Mass in GeV")

ggplot(massH,aes(higgs)) + geom_histogram(aes(fill = ..count..),binwidth=25)


smoothScatter(time,higgs,xlab="Year of Publication", ylab="Higgs Mass (GeV)", 
              colramp = colorRampPalette(c("white", blues9)))  





