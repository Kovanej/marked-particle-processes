
library(plotrix)


plotTheRectangles <- function(
  markedBoolean, colorBorder, colorInterior
){
    
  for (i in 1:markedBoolean[["Grains"]]$n){
    polygon(
      x = markedBoolean[["Grains"]]$x[[i]], y = markedBoolean[["Grains"]]$y[[i]],
      colorInterior[markedBoolean[["Germs"]]$marks[i]], 
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
    
    draw_circle_extended(
      x = markedBoolean[["Germs"]]$x[[i]], y = markedBoolean[["Germs"]]$y[[i]],
      radius = markedBoolean[["Grains"]]$rad[[i]],
      border = colorBorder,
      col = colorInterior[markedBoolean[["Germs"]]$marks[i]]
      )
    
  }
   
}



draw_circle_extended <- function (x, y, radius, nv = 1000, border = NULL, col = NA, lty = 1, 
          density = NULL, angle = 45, lwd = 1, onlyInside = TRUE) 
{
  xylim <- par("usr")
  plotdim <- par("pin")
  ymult <- getYmult()
  angle.inc <- 2 * pi/nv
  angles <- seq(0, 2 * pi - angle.inc, by = angle.inc)
  if (length(col) < length(radius)) 
    col <- rep(col, length.out = length(radius))
  for (circle in 1:length(radius)) {
    xv <- cos(angles) * radius[circle] + x
    yv <- sin(angles) * radius[circle] * ymult + y
    if (onlyInside){
      for (i in 1:length(xv)){
        xv[i] = min(max(xv[i], 0), 1)
        yv[i] = min(max(yv[i], 0), 1)
      }
      
    } else {
    xv <- cos(angles) * radius[circle] + x
    yv <- sin(angles) * radius[circle] * ymult + y
    }
    polygon(xv, yv, border = border, col = col[circle], 
            lty = lty, density = density, angle = angle, lwd = lwd)
  }
    invisible(list(x = xv, y = yv))
}