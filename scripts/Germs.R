library(spatstat)


generatePoisson <- function(lambda, homogeneous = TRUE){
  
  if (homogeneous) {
    return(rpoispp(lambda))
  }
  
}


appendTheRectangles <- function(
  Germs, meanEdgeLength = 0.3, varEdgeLength = 0,
  equal_sites = TRUE
){
  
  polygons_vectors <- list()
  
  polygons_vectors$x <- list()
  polygons_vectors$y <- list()
  
  for (point_no in 1:Germs$n){
    
    x_cord <- Germs$x[point_no]
    y_cord <- Germs$y[point_no]
    
    edgeLength_x = abs(rnorm(n=1, mean=meanEdgeLength, sd = varEdgeLength))
    if (equal_sites){
      edgeLength_y = edgeLength_x
    } else {
      edgeLength_y = abs(rnorm(n=1, mean=meanEdgeLength, sd = varEdgeLength))
    }
    
    polygons_vectors$x[[point_no]] = c(
      x_cord - edgeLength_x/2, x_cord + edgeLength_x/2, x_cord + edgeLength_x/2, x_cord - edgeLength_x/2
    )
    
    polygons_vectors$y[[point_no]] = c(
      y_cord - edgeLength_y/2, y_cord - edgeLength_y/2, y_cord + edgeLength_y/2, y_cord + edgeLength_y/2
    )
    
  }
  
  polygons_vectors$n = Germs$n
  
  return(polygons_vectors)
  
}
