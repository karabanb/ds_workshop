library(tidyverse)
library(moments)

#pozycyjny wspolczynnik asymetrii A = Q3 + Q1 - 2 Me / Q3 - Q1

asymetry_q <- function (x) {
  (quantile(x,0.75) + quantile(x,0.25) - 2 * median(x)) / IQR(x)
}

p2 <- function(x){
  3*((mean(x)-median(x))/sd(x))
}


load('data/012_skewed_data.Rdata')

skewed_data %>% group_by(skewness) %>% summarise(asymetry_q(x), p2(x))
skewed_data %>% group_by(skewness) %>% summarise(asymetry_q(x*100), p2(x))

skew <- function(x){
  sum((x-mean(x))^3)/length(x)/sd(x)^3
}

skewed_data %>% filter(skewness == 'left skewed') %>% summarise(skew(x), skewness(x))

bench_skewness <- microbenchmark(skewness(skewed_data$x), skew(skewed_data$x), 1000)

