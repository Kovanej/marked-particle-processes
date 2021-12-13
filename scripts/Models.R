# rm(list=ls())

# library(spatstat)
# library(plotrix)
# library(randomcoloR)

source(file.path(paste0(getwd(), "/scripts"), "Germs.R"))
source(file.path(paste0(getwd(), "/scripts"), "Grains.R"))
source(file.path(paste0(getwd(), "/scripts"), "Markings.R"))


getAndPlotTheBooleanModelRealization <- function(
  poissInt=100, meanEdgeLength = 0.2, varEdgeLength = 0,
  colorBackground = "white", colorBorder = "black", colorInterior = "random",
  equal_sites = TRUE, only_inside = TRUE
  ){
  
  markedBoolean <- list()
  markedBoolean[["Germs"]] <- generatePoisson(poissInt)
  markedBoolean[["Grains"]] <- appendTheRectangles(
    markedBoolean[["Germs"]],
    meanEdgeLength = meanEdgeLength,
    varEdgeLength = varEdgeLength,
    equal_sites = equal_sites
    )
  markedBoolean[["GrainsMarks"]] <- assingTheNearestNeighbourBernoulli(
    markedBoolean[["Germs"]]
  )
  
  markedBoolean$Germs$markformat = "vector"
  markedBoolean$Germs$marks = markedBoolean$GrainsMarks
  
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
       #col=colorBackground, 
       main = "")
  
  if (colorBorder == "random"){
    # colorBorder = hsv(
    #   0.9,
    #   runif(1) / 2,
    #   runif(1) / 2,
    #   runif(1) / 2
    # )
    colorBorder = randomColor(count=1, luminosity="light")
  }
  
  if (colorInterior == "random"){
    # colorInterior = hsv(
    #   0.9,
    #   runif(1) / 2,
    #   runif(1) / 2,
    #   runif(1) /2
    # )
    # get the better transparency, so that points can be seen
    colorInterior_col = randomColor(count=length(levels(markedBoolean$GrainsMarks)), luminosity="light")
    colorInterior_hsv = rgb2hsv(col2rgb(colorInterior_col))
    colorInterior = c()
    for (col in 1:ncol(colorInterior_hsv)){
      colorInterior = append(
        colorInterior, 
        hsv(colorInterior_hsv[1, col], colorInterior_hsv[2, col], colorInterior_hsv[3, col], alpha = 0.3)
      )
    }
  }
  
  for (i in 1:markedBoolean[["Grains"]]$n){
    
    polygon(
      x = markedBoolean[["Grains"]]$x[[i]], y = markedBoolean[["Grains"]]$y[[i]],
      col = colorInterior[markedBoolean[["Germs"]]$marks[i]], 
      # density = 1,
      # angle = 30 * floor(( abs(rnorm(n=1, mean=90, sd = 40)) / 30 )),
      border = colorBorder,
      # lty = "twodash"
      )

  }
  
}
