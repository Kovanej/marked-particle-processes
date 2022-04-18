
NO_OF_LINES = 100
MIN_WIN = 0
MAX_WIN = 1

L <- psp(
  runif(n=NO_OF_LINES, min=MIN_WIN, max=MAX_WIN), 
  runif(n=NO_OF_LINES, min=MIN_WIN, max=MAX_WIN),
  runif(n=NO_OF_LINES, min=MIN_WIN, max=MAX_WIN),
  runif(n=NO_OF_LINES, min=MIN_WIN, max=MAX_WIN),
  window=owin(c(MIN_WIN, MAX_WIN), c(MIN_WIN, MAX_WIN))
)

base = (180 * (
  acos(
    abs(L$ends$x0 - L$ends$x1)/(sqrt((L$ends$x1 - L$ends$x0)^2 + (L$ends$y1 - L$ends$y0)^2)))
  )/pi) %% 360

true_base = ifelse(
  (
      ((L$ends$x0 <  L$ends$x1) & (L$ends$y0 >  L$ends$y1)) | 
      ((L$ends$x0 >  L$ends$x1) & (L$ends$y0 <  L$ends$y1))
    ),
  180 - base,
  base
  )

true_base

(true_base_norm = true_base / 180)

marks = c()
for (line in 1:length(true_base_norm)){
  marks[line]=rbinom(n=1, size=1, p=true_base_norm[line])
  print(paste0("PROB: ", true_base_norm[line], "  ", "MARK: ", marks[line]))
}
L$markformat = "factor"
as.factor(marks)
L$marks = as.factor(marks)

plot.psp(L, main="")


#View(L)
