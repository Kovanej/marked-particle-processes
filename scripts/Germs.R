library(spatstat)


generatePoisson <- function(lambda, homogeneous = TRUE){
  
  if (homogeneous) {
    return(rpoispp(lambda))
  }
  
}


appendTheRectangles <- function(
  Germs, meanEdgeLength = 0.3, varEdgeLength = 0,
  equalSites = TRUE, onlyInside = TRUE
){
  
  polygons_vectors <- list()
  
  polygons_vectors$x <- list()
  polygons_vectors$y <- list()
  
  for (point_no in 1:Germs$n){
    
    x_cord <- Germs$x[point_no]
    y_cord <- Germs$y[point_no]
    
    edgeLength_x = abs(rnorm(n=1, mean=meanEdgeLength, sd = varEdgeLength))
    if (equalSites){
      edgeLength_y = edgeLength_x
    } else {
      edgeLength_y = abs(rnorm(n=1, mean=meanEdgeLength, sd = varEdgeLength))
    }
    
    if (onlyInside){
      # TODO: do we always use [0,1]^2 window?
      x_low = max(0, x_cord - edgeLength_x/2)
      x_upp = min(1, x_cord + edgeLength_x/2)
      y_low = max(0, y_cord - edgeLength_y/2)
      y_upp = min(1, y_cord + edgeLength_y/2)
    }
    else {
      x_low = x_cord - edgeLength_x/2
      x_upp = x_cord + edgeLength_x/2
      y_low = y_cord - edgeLength_y/2
      y_upp = y_cord + edgeLength_y/2
    }
    
    polygons_vectors$x[[point_no]] = c(
      x_low, x_upp, x_upp, x_low
    )
    
    polygons_vectors$y[[point_no]] = c(
      y_low, y_low, y_upp, y_upp
    )
    
  }
  
  polygons_vectors$n = Germs$n
  
  return(polygons_vectors)
  
}

appendTheCircles <- function(
  Germs, meanRadius = 0.3, varRadius = 0, onlyInside = TRUE
  ){
  
  circles_vectors <- list()
  
  circles_vectors$center_x <- list()
  circles_vectors$center_y <- list()
  circles_vectors$rad <- list()
  
  for (point_no in 1:Germs$n){
    
    x_cord <- Germs$x[point_no]
    y_cord <- Germs$y[point_no]
    
    circles_vectors$center_x[[point_no]] = x_cord
    
    circles_vectors$center_y[[point_no]] = y_cord
    
    radius = abs(rnorm(n=1, mean = meanRadius, sd = varRadius))
    
    circles_vectors$rad[[point_no]] = radius
    
  }
  
  circles_vectors$n = Germs$n
  
  return(circles_vectors)
  
}