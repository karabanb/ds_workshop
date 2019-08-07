
### Libraries ######################################################################################

library(tidyverse)


### Solutions ######################################################################################

set.seed(1234)

### excercise 1 ------------------------------------------------------------------------------------

norm_sd1 <- rnorm(1000)
norm_sd2 <- rnorm(1000, sd = 2)
norm_sd3 <- rnorm(1000, sd = 3)

# my own range function

range_bk <- function(x) {
  max(x) - min(x)
}

normal_distr <- data.frame(sd1 = norm_sd1, sd2 = norm_sd2, sd3 = norm_sd3)

sapply(normal_distr, range_bk)
sapply(normal_distr, IQR)
sapply(normal_distr, var)
sapply(normal_distr, sd)

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

iq <- data.frame(n_100 = iq_n100, n_10000 = iq_n10000, n_100000 = iq_n1000000)
wechsler_iq <- c(80, 90, 110, 120)

iq_quantiles <- as.data.frame(sapply(iq, quantile, probs = c(0.1, 0.25, 0.75, 0.9)))
iq_quantiles


iq <- iq_n100
sd_iq <- sd(iq_n100)
mean_iq <- mean(iq_n100)
n <- length(iq_n100)

sum(iq > (mean_iq - sd_iq) & iq< (mean_iq + sd_iq))/n # 1s 0.682
sum(iq > (mean_iq - 2 * sd_iq) & iq < (mean_iq + 2 * sd_iq))/n # 1s < 0.955
sum(iq > (mean_iq- 3 * sd_iq) & iq < (mean_iq + 3 * sd_iq))/n # 1s < 0.997









