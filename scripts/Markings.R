library(spatstat)


assingTheNearestNeighbourBernoulli <- function(germs){
  
  marks = c()
  
  for (germ in 1:germs$n){
    
    germ_nearest_neighbour = nndist(germs)[germ]
    
    # mark = rbinom(n=1, size=1, prob = max(0, (1-germ_nearest_neighbour)/2))
    mark = rbinom(n=1, size=1, prob = 1/2)
    
    marks = append(marks, mark)
    
  }
  
  marks = as.factor(marks)
  
  return(marks)
  
}