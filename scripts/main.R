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
meanEdgeLength = 0.1
varEdgeLength = 0.0
colorBackground = "white" 
colorBorder = "black"
colorInterior = "random"
equalSites = TRUE
onlyInside = TRUE
pointPlotPch = 20
grainsType = "rectangle"

bool_model = getAndPlotTheBooleanModelRealization(
  poissInt = poissInt, 
  meanEdgeLength = meanEdgeLength, 
  varEdgeLength = varEdgeLength,
  colorBackground = colorBackground, 
  colorBorder = colorBorder, 
  colorInterior = colorInterior,
  equalSites = equalSites,
  onlyInside = onlyInside,
  pointPlotPch = pointPlotPch,
  grainsType = grainsType
)
