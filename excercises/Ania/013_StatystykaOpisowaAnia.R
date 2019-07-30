library(tidyverse)
?rnorm

###Exc 1 - Normal distibution and variation measures calculation
norm_sd1 <- rnorm(1000,0,1)
norm_sd2 <- rnorm(1000,0,2)
norm_sd3 <- rnorm(1000,0,3)

#range,  coefficient of variation
range(norm_sd1)
range(norm_sd2)
range(norm_sd3)

#IQR
IQR(norm_sd1)
IQR(norm_sd2)
IQR(norm_sd3)

#variance
var(norm_sd1)
var(norm_sd2)
var(norm_sd3)

#standard deviation
sd(norm_sd1)
sd(norm_sd2)
sd(norm_sd3)

#coefficient of variation
coef <- function(x) {
  (sqrt((sum((x - mean(x))^2))/(length(x) - 1))/mean(x)) *100
}

coef(norm_sd1)
coef(norm_sd2)
coef(norm_sd3)

#line chart of vectors value distribution
#base plots
plot(density(norm_sd1), col = "blue", main = "Distibution of vectors values")
main = "Distibution of vectors values"
lines(density(norm_sd2), col = "red")
lines(density(norm_sd3), col = "green")

#ggplot
library("reshape2")
norm_sd_together <- data.frame(norm_sd1,norm_sd2,norm_sd3)
norm_sd_total <- melt(norm_sd_together)

ggplot(norm_sd_total, aes(x=value, colour=variable)) + geom_density(size = 1) +
  labs(title ="Distribution of vectors values")

#boxplot chart of vectors value distribution
# base plots
boxplot(norm_sd1,norm_sd2, norm_sd3, col = "green", horizontal = T, 
        main = "Boxplots of vectors values distribution")
#ggplot
ggplot(norm_sd_total, aes(y=value, colour=variable)) + geom_boxplot(size = 1) +
  labs(title ="Distribution of vectors values")

### Exc2 
