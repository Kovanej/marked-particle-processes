rm(list=ls())

library(spatstat)
library(plotrix)
library(randomcoloR)

source(file.path(paste0(getwd(), "/scripts"), "Colors.R"))
source(file.path(paste0(getwd(), "/scripts"), "Germs.R"))
source(file.path(paste0(getwd(), "/scripts"), "Grains.R"))
source(file.path(paste0(getwd(), "/scripts"), "Markings.R"))
source(file.path(paste0(getwd(), "/scripts"), "Plotting.R"))
source(file.path(paste0(getwd(), "/scripts"), "Models.R"))

poissInt = 25
meanEdgeLength = 0.1
sdEdgeLength = 0.05 / sqrt(3)
colorBackground = "white" 
colorBorder = "black"
colorInterior = "random"
equalSites = TRUE
onlyInside = TRUE
pointPlotPch = 20
grainsType = "circle"

par(mar=c(5, 4, 4, 8), xpd=TRUE)

bool_model = getAndPlotTheBooleanModelRealization(
  poissInt = poissInt, 
  meanEdgeLength = meanEdgeLength, 
  sdEdgeLength = sdEdgeLength,
  colorBackground = colorBackground, 
  colorBorder = colorBorder, 
  colorInterior = colorInterior,
  equalSites = equalSites,
  onlyInside = onlyInside,
  pointPlotPch = pointPlotPch,
  grainsType = grainsType
)
