rm(list=ls())

library(spatstat)
library(plotrix)
library(randomcoloR)

source(file.path(paste0(getwd(), "/scripts"), "Models.R"))
source(file.path(paste0(getwd(), "/scripts"), "Germs.R"))
source(file.path(paste0(getwd(), "/scripts"), "Grains.R"))
source(file.path(paste0(getwd(), "/scripts"), "Markings.R"))



poissInt = 100
meanEdgeLength = 0.05
varEdgeLength = 0.05
colorBackground = "white" 
colorBorder = "black"
colorInterior = "random"
equal_sites = TRUE
only_inside = TRUE


bool_model = getAndPlotTheBooleanModelRealization(
  poissInt = poissInt, 
  meanEdgeLength = meanEdgeLength, 
  varEdgeLength = varEdgeLength,
  colorBackground = colorBackground, 
  colorBorder = colorBorder, 
  colorInterior = colorInterior,
  equal_sites = equal_sites,
  only_inside = only_inside
)

a = 1