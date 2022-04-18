# x_poiss <- rpoispp(50)
# plot(x_poiss)
# x_poiss$n
# 
# if (x_poiss$n %% 2 == 1){
#   
#   a = 1
#   
# }

live <- interactive()
L <- psp(
  runif(n=100), runif(n=100), runif(n=100), runif(n=100), window=owin()
  )
if(live) plot(L, main="")
# uniform intensity
Y <- rpoisppOnLines(4, L)
if(live) plot(Y, add=TRUE, pch="+")
# uniform MARKED process with types 'a' and 'b'
Y <- rpoisppOnLines(c(a=4, b=5), L)
if(live) {
  plot(L, main="")
  plot(Y, add=TRUE, pch=16)
}


# each cluster consist of 10 points in a disc of radius 0.2
nclust <- function(x0, y0, radius, n) {
  return(runifdisc(n, radius, centre=c(x0, y0)))
}
plot(rNeymanScott(10, 0.5, nclust, radius=0.2, n=10))

# poisson point process
X <- rpoispp(100)

plot(X, pch = 16)
X$n
