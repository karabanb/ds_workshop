
#### LIBRARIES #####################################################################################

library(tidyverse)

#### PLOTS #########################################################################################

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


       