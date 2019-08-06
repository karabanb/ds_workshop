
#### LIBRARIES #####################################################################################

library(tidyverse)
library(BBmisc)

#### PLOTS #########################################################################################

set.seed(1234)

# dispersion 

df_points <- data.frame('Zbiór 1' = c(1:5, 6, 6, 7:11),
                        'Zbiór 2' = c(4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8))

df_reshaped <- df_points %>% gather('subset', 'numbers')

ggplot(df_reshaped, aes(numbers)) + 
  geom_dotplot(binwidth = 0.4, stackratio = 1.5, color = 'black') +
  facet_grid(~subset) +
  coord_fixed(ratio=2.5) +
  theme_bw() +
  scale_x_continuous(breaks = seq(1,12,1)) +
  theme(axis.text.y = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        line = element_blank(),
        title = element_blank()
  ) +
  ggsave('images/012_variablility.png', width = 200, height = 30, units = 'mm')

# Skewness

non_skewed <- normalize(rnorm(10000), method = 'range')
right_skewed <- normalize(rbeta(10000, shape1 = 1, shape2 = 3), method = 'range')
left_skewed <- normalize(-right_skewed, method = 'range')

non_skewed <- data.frame(x = non_skewed, skewness = 'non skewed', stringsAsFactors = FALSE)
right_skewed <- data.frame(x = right_skewed, skewness = 'right skewed', stringsAsFactors = FALSE)
left_skewed <- data.frame(x = left_skewed, skewness = 'left skewed', stringsAsFactors = FALSE)

skewed_data <- bind_rows(non_skewed, right_skewed, left_skewed)

save(skewed_data, file = 'data/012_skewed_data.Rdata')

ggplot(skewed_data, aes(x, fill = skewness)) + 
  geom_density(alpha = 0.4) +
  facet_grid(.~skewness) +
  scale_x_continuous(breaks = c(0, 0.5, 1)) +
  theme_bw() +
  theme(legend.position = 'none', panel.spacing = unit(1, 'lines')) + 
  ggsave('images/012_skewness.png', width = 10, height = 6, units = 'cm')

ggplot(skewed_data, aes(x = skewness, y = x, fill = skewness)) +
  geom_boxplot(alpha = 0.4) +
  coord_flip() +
  theme_bw() +
  theme(legend.position = 'none') +
  ggsave('images/012_skewness_boxplots.png', width = 10, height = 6, units = 'cm')

rm(non_skewed, right_skewed, left_skewed)

# the simplest measure of skewness

asymetry_second <- function(x){
  3*((mean(x)-median(x))/sd(x))
}

asymetry_iqr <- function(x){
  (quantile(x, 0.75) + quantile(x, 0.25) - 2* median(x))/IQR(x)
}

skewed_data$x <- skewed_data$x*100

skewed_data %>% 
  group_by(skewness) %>% 
  summarise(mean = mean(x),
            median = median(x),
            asym_simplest = mean(x)/median(x), 
            asym_pearson = asymetry_second(x),
            asym_iqr = asymetry_iqr(x)
  )


