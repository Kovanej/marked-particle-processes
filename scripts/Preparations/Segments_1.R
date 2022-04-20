### TRY TO CREATE PROPER BOOLEAN GERM GRAIN MODEL

LAMBDA = 100
OVERLAP = FALSE

WIN_X_MIN = 0
WIN_Y_MIN = 0
WIN_X_MAX = 1
WIN_Y_MAX = 1

MIN_SEGMENT_LEN = 0.2
MAX_SEGMENT_LEN = 0.4



ppp <- rpoispp(lambda = LAMBDA)
plot(ppp)

generate_angle <- function(){
  
  angle = runif(n=1, min=0, max=pi)
  return(angle)
  
}

generate_len <- function(){
  
  len = runif(1, min=MIN_SEGMENT_LEN, max=MAX_SEGMENT_LEN)
  return(len)
  
}

x0 <- c()
x1 <- c()
y0 <- c()
y1 <- c()

for (point_no in 1:range(ppp$n)){
  
  angle = generate_angle()
  len = generate_len()
  
  x0[point_no] = ppp$x[point_no] - 1/2 * len * cos(angle)
  x1[point_no] = ppp$x[point_no] + 1/2 * len * cos(angle)
  y0[point_no] = ppp$y[point_no] - 1/2 * len * sin(angle)
  y1[point_no] = ppp$y[point_no] + 1/2 * len * sin(angle)
  
}

if (! OVERLAP){
  x0 = ifelse(x0 < WIN_X_MIN, WIN_X_MIN, x0)
  x0 = ifelse(x0 > WIN_X_MAX, WIN_X_MAX, x0)
  x1 = ifelse(x1 < WIN_X_MIN, WIN_X_MIN, x1)
  x1 = ifelse(x1 > WIN_X_MAX, WIN_X_MAX, x1)
  y0 = ifelse(y0 < WIN_Y_MIN, WIN_Y_MIN, y0)
  y0 = ifelse(y0 > WIN_Y_MAX, WIN_Y_MAX, y0)
  y1 = ifelse(y1 < WIN_Y_MIN, WIN_Y_MIN, y1)
  y1 = ifelse(y1 > WIN_Y_MAX, WIN_Y_MAX, y1)
}

L <- psp(x0=x0, y0=y0, x1=x1, y1=y1, window = owin(), check = FALSE)

plot(L, main="")


# MARKS

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


marks_colors = c()
marks_colors = randomColor(count=2, luminosity="dark")
# 
# for (i in 1:2){
#   marks_colors[i] = hsv(
#     runif(1),
#     1/3,
#     runif(1),
#     runif(1)
#   )
# } 

plot.psp(
  L, main="", col = marks_colors
  #style = "width"
  )
