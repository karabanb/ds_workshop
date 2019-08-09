### Libraries ######################################################################################

library(tidyverse)


### Solutions ######################################################################################

set.seed(1234)

### excercise 1 ------------------------------------------------------------------------------------

norm_sd1 <- rnorm(1000)
norm_sd2 <- rnorm(1000, sd = 2)
norm_sd3 <- rnorm(1000, sd = 3)

# my own range function

range_bk <- function(x){
  max(x) - min(x)
}

var_coef <- function(x){sd(x)/mean(x)}


normal_distr <- data.frame(sd1 = norm_sd1, sd2 = norm_sd2, sd3 = norm_sd3)

sapply(normal_distr, range_bk)
sapply(normal_distr, IQR)
sapply(normal_distr, var)
sapply(normal_distr, sd)
sapply(normal_distr, var_coef)     

#  niestabilne zachowanie wspolczynnika zmiennosci, miara wrazliwa gdy srednia bliska 0

ggplot(gather(normal_distr, "sd", "x"), aes(x, col = sd)) +
  geom_density() +
  theme_bw()

ggplot(gather(normal_distr, "sd", "x"), aes(y = x, fill = sd)) +
  geom_boxplot(alpha = 0.3) +
  coord_flip() +
  theme_bw()


### excercise 2 ------------------------------------------------------------------------------------

iq_n100 <- rnorm(100, mean = 100, sd = 15)
iq_n10000 <- rnorm(10000, mean = 100, sd = 15)
iq_n1000000 <- rnorm(1000000, mean = 100, sd = 15)

iq_df <- data.frame(n_100 = iq_n100, n_10000 = iq_n10000, n_100000 = iq_n1000000)
wechsler_iq <- c(80, 90, 110, 120)

iq_quantiles <- as.data.frame(sapply(iq_df, quantile, probs = c(0.1, 0.25, 0.75, 0.9)))
iq_quantiles


### n = 100

iq <- iq_n100
sd_iq <- sd(iq)
mean_iq <- mean(iq)
n <- length(iq)

sum(iq > (mean_iq - sd_iq) & iq< (mean_iq + sd_iq))/n # 1s 0.682
sum(iq > (mean_iq - 2 * sd_iq) & iq < (mean_iq + 2 * sd_iq))/n # 2s >= 0.955
sum(iq > (mean_iq- 3 * sd_iq) & iq < (mean_iq + 3 * sd_iq))/n # 2s >= 0.997

### n = 10000

iq <- iq_n10000
sd_iq <- sd(iq)
mean_iq <- mean(iq)
n <- length(iq)

sum(iq > (mean_iq - sd_iq) & iq< (mean_iq + sd_iq))/n # 1s 0.682
sum(iq > (mean_iq - 2 * sd_iq) & iq < (mean_iq + 2 * sd_iq))/n # 2s >= 0.955
sum(iq > (mean_iq- 3 * sd_iq) & iq < (mean_iq + 3 * sd_iq))/n # 2s >= 0.997

### n = 1000000

iq <- iq_n1000000
sd_iq <- sd(iq)
mean_iq <- mean(iq)
n <- length(iq)

sum(iq > (mean_iq - sd_iq) & iq< (mean_iq + sd_iq))/n # 1s 0.682
sum(iq > (mean_iq - 2 * sd_iq) & iq < (mean_iq + 2 * sd_iq))/n # 2s >= 0.955
sum(iq > (mean_iq- 3 * sd_iq) & iq < (mean_iq + 3 * sd_iq))/n # 2s >= 0.997

ggplot(gather(iq_df, 'n', 'iq'), aes(iq, col = n)) + 
  geom_density() +
  theme_bw()


### excercise 3 ------------------------------------------------------------------------------------

sapply(iris[,1:4], var_coef)    # najwieksza zmiennosc cechuje Petal.Width

iris %>%
  group_by(Species) %>%         # Sepal.Length - virginica,
  summarise_all(sd)             # Sepal.Width - setosa
                                # Petal.Length - virginica,
                                # Petal.Width - virginica
