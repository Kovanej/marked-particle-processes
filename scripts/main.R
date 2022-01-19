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

poissInt = 50
meanEdgeLength = 0.05
sdEdgeLength = 0.0
colorBackground = "white" 
colorBorder = "black"
colorInterior = "random"
equalSites = TRUE
onlyInside = TRUE
pointPlotPch = 20
grainsType = "circle"

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
