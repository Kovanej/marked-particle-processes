# rm(list=ls())

# library(spatstat)
# library(plotrix)
# library(randomcoloR)

source(file.path(paste0(getwd(), "/scripts"), "Colors.R"))
source(file.path(paste0(getwd(), "/scripts"), "Germs.R"))
source(file.path(paste0(getwd(), "/scripts"), "Grains.R"))
source(file.path(paste0(getwd(), "/scripts"), "Markings.R"))
source(file.path(paste0(getwd(), "/scripts"), "Plotting.R"))




getAndPlotTheBooleanModelRealization <- function(
  poissInt=100, meanEdgeLength = 0.2, sdEdgeLength = 0,
  colorBackground = "white", colorBorder = "black", colorInterior = "random",
  equalSites = TRUE, onlyInside = TRUE, pointPlotPch = ".",
  grainsType = "rectangle"
  ){
  
  markedBoolean <- list()
  markedBoolean[["Germs"]] <- generatePoisson(poissInt)
  if (grainsType == "rectangle"){
    markedBoolean[["Grains"]] <- appendTheRectangles(
      markedBoolean[["Germs"]],
      meanEdgeLength = meanEdgeLength,
      sdEdgeLength = sdEdgeLength,
      equalSites = equalSites,
      onlyInside = onlyInside
    )
  } else if (grainsType == "circle"){
    markedBoolean[["Grains"]] <- appendTheCircles(
      markedBoolean[["Germs"]],
      meanRadius = meanEdgeLength,
      sdRadius = sdEdgeLength,
      onlyInside = onlyInside
    )
  }
  
  markedBoolean[["GrainsMarks"]] <- assingTheNearestNeighbourBernoulli(
    markedBoolean[["Germs"]]
  )

  # markedBoolean$Germs$markformat = "vector"
  # markedBoolean$Germs$marks = markedBoolean$GrainsMarks
  
  # plot(markedBoolean$Germs)
  
  if (colorBackground == "random"){
    
    colorBackground = hsv(
      0.5,
      runif(1),
      runif(1),
      runif(1)
    )
    # colorBackground = randomColor(count=1, luminosity="light")
  }
  
  plot(markedBoolean[["Germs"]], 
      # col=colorBackground, 
       pch = pointPlotPch,
       main = "")
  
  if (colorBorder == "random"){
    colorBorder = randomColor(count=1, luminosity="light")
  }
  
  if (colorInterior == "random"){
    # get the better transparency, so that points can be seen
    colorInterior_col = randomColor(
      count= 1, #length(levels(markedBoolean$GrainsMarks)), 
      luminosity="light"
      )
    colorInterior_hsv = rgb2hsv(col2rgb(colorInterior_col))
    colorInterior = c()
    for (col in 1:ncol(colorInterior_hsv)){
      colorInterior = append(
        colorInterior, 
        hsv(colorInterior_hsv[1, col], colorInterior_hsv[2, col], colorInterior_hsv[3, col], alpha = 0.3)
      )
      print(colorInterior)
    }
    
  }
  
  if (grainsType == "rectangle"){
    plotTheRectangles(
      markedBoolean = markedBoolean, colorBorder = colorBorder, colorInterior = colorInterior
      )
  } else if (grainsType == "circle"){
    plotTheCircles(
      markedBoolean = markedBoolean, colorBorder = colorBorder, colorInterior = colorInterior
    )
  }
  
  
  
  }
