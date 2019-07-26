
### Libraries --------------------------------------------------------------------------------------

library(tidyverse)


### Solutions --------------------------------------------------------------------------------------

norm_sd1 <- rnorm(10e6)
norm_sd2 <- rnorm(10e6, sd = 2)
norm_sd3 <- rnorm(10e6, sd = 3)

# my own functions

range_bk <- function(x) {
  max(x) - min(x)
}


listed_norm <- list(sd1 = norm_sd1, sd2 = norm_sd2, sd3 = norm_sd3)

sapply(listed_norm, range_bk)
sapply(listed_norm, IQR)
sapply(listed_norm, var)
sapply(listed_norm, sd)

iq_n100 <- rnorm(100, mean = 100, sd = 15)
iq_n10000 <- rnorm(10000, mean = 100, sd = 15)
iq_n1000000 <- rnorm(1000000, mean = 100, sd = 15)

