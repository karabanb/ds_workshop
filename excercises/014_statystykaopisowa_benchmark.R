sd_withn <- function(x) {
  sumcia <- 0
  for (i in 1:length(x)) {
    b <- sum((x[i] - mean(x))^2)
    sumcia <- sumcia + b
    i <- i + 1
  }
  print((sumcia / (length(x)-1))^0.5)
}
