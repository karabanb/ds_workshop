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

### Exc2 Three sigma rule - vectors creation

iq_n100 <- rnorm(100,100,15)
iq_n10000 <- rnorm(10000,100,15)
iq_n1000000 <- rnorm(1000000,100,15)

#three sigma calculation

three_sigma <- function(x){
  sigma_1=length(which(x>mean(x) + 1*sd(x)| x<(mean(x) - 1*sd(x))))/length(x)*100
  sigma_2=length(which(x>mean(x) + 2*sd(x)| x<(mean(x) - 2*sd(x))))/length(x)*100
  sigma_3=length(which(x>mean(x) + 3*sd(x)| x<(mean(x) - 3*sd(x))))/length(x)*100
  all_sigmas <- data.frame(sigma_1,sigma_2,sigma_3)
  print(all_sigmas)
}

three_sigma(iq_n100)
three_sigma(iq_n10000)
three_sigma(iq_n1000000)

# Conclusion: For all three vectors three sigma rule is kept for 68,2% observations in interval [μ–σ,μ+σ], 
#         for 95,4% in interval [μ–2σ,μ+2σ] and for 99,7% in interval[μ–3σ,μ+3σ]

#calculate values of 10th percentile, 1st quartile, 3rd quartile and 90th percentile for all vectors

quantile(iq_n100,c(0.1,0.25,0.75,0.9), type = 7)
quantile(iq_n10000,c(0.1,0.25,0.75,0.9), type = 7)
quantile(iq_n1000000,c(0.1,0.25,0.75,0.9), type = 7)

#Conclusion: The bigger the number of observation, the more scores are closer to ones from Wechsler scale.

#Check on vector iq_n1000000 what is the % od observations for: iq < 80, iq < 100, iq < 115 i iq > 140
length(which(iq_n1000000<80))/length(iq_n1000000) *100  #score: 9.11%
length(which(iq_n1000000<100))/length(iq_n1000000) *100 #score: 49.94%
length(which(iq_n1000000<115))/length(iq_n1000000) *100 #score: 84.08%
length(which(iq_n1000000>140))/length(iq_n1000000) *100 #score: 0.37%

#density plot of all vectors

vec_n100 <- data.frame("value"=iq_n100, "vec" = "iq_n100")
vec_n10000 <- data.frame("value" = iq_n10000, "vec" = "iq_n10000")
vec_n1000000 <- data.frame("value" = iq_n1000000, "vec" = "iq_n1000000")

iq_total <- rbind(vec_n100,vec_n10000, vec_n1000000)

ggplot(iq_total, aes(x = value, color = vec)) + geom_density(size = 1) +
  labs(title ="Distribution of vectors values")

### Exc 3 - Iris dataset examination
head(iris)
str(iris)

#which variable has the biggest variability
variance_measures <- function(x) {
  c(sdev = sd(x), variance = var(x))
}

variance_measures(iris$Sepal.Length)

sapply(iris[,1:4], variance_measures)

#Conclusion - the biggest value is for Petal.Length

#which species has the biggest variability

summary_iris <- iris %>%  group_by(Species) %>% 
  summarise(
    sd(Sepal.Length),
    var(Sepal.Length),
    sd(Sepal.Width),
    var(Sepal.Width),
    sd(Petal.Length),
    var(Petal.Length),
    sd(Petal.Width),
    var(Petal.Width)
  )
#Conclusion - The biggest variability for Sepal.Length - virginica, for Sepal. Width - setosa, 
#for Petal.Length - virginica, for Petal.Width - virginica


