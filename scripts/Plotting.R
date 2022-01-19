
library(plotrix)


plotTheRectangles <- function(
  markedBoolean, colorBorder, colorInterior
){
    
  for (i in 1:markedBoolean[["Grains"]]$n){
    polygon(
      x = markedBoolean[["Grains"]]$x[[i]], y = markedBoolean[["Grains"]]$y[[i]],
      col = colorInterior[1], #colorInterior[markedBoolean[["Germs"]]$marks[i]], 
      # density = 1,
      # angle = 30 * floor(( abs(rnorm(n=1, mean=90, sd = 40)) / 30 )),
      border = colorBorder,
      # lty = "twodash"
    )
    
  }
  
}


plotTheCircles <- function(
  markedBoolean, colorBorder, colorInterior
){
  
  for (i in 1:markedBoolean[["Grains"]]$n){
    
    draw.circle(
      x = markedBoolean[["Germs"]]$x[[i]], y = markedBoolean[["Germs"]]$y[[i]],
      radius = markedBoolean[["Grains"]]$rad[[i]],
      border = colorBorder,
      col = colorInterior[1]
      )
    
  }
   
}