#pozycyjny wspolczynnik asymetrii A = Q3 + Q1 - 2 Me / Q3 - Q1

asymetry_q <- function (x) {
  (quantile(x,0.75) + quantile(x,0.25) - 2 * median(x)) / IQR(x)
}

p2 <- function(x){
  3*((mean(x)-median(x))/sd(x))
}


load('data/012_skewed_data.Rdata')
