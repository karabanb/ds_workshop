# Miary zmienności (rozproszenia)

# zadanie 1

?rnorm

norm_sd1 <- rnorm(1000,mean=0,sd=1)
norm_sd2 <- rnorm(1000,mean=0,sd=2)
norm_sd3 <- rnorm(1000,mean=0,sd=3)

# range - rozstep

range(norm_sd1)
range(norm_sd2)
range(norm_sd3)


# IQR - rozstep miedzykwartylowy

IQR(norm_sd1)
IQR(norm_sd2)
IQR(norm_sd3)

# variance - wariancja

var(norm_sd1)
var(norm_sd2)
var(norm_sd3)

# standard deviation - sd

sd(norm_sd1)
sd(norm_sd2)
sd(norm_sd3)

# WNIOSEK: wektor z najnizszym sd jest najmniej zroznicowany, jego wartosci sa bardziej skoncentrowane sredniej

# Wykonaj jeden wykres, na którym znajdują się trzy rozkłady dla zmiennych norm_sd1, norm_sd2, norm_sd3

library(ggplot2)
library(dplyr)
library(tidyverse)

norm_sd_all <- data.frame(norm_sd1,norm_sd2,norm_sd3) %>% 
  gather(key="norm_sd",value="value",norm_sd1:norm_sd3)

norm_sd_all %>% 
  ggplot(aes(value,group=norm_sd,color=norm_sd))+
  geom_density(size=1)+
  theme_light()

# Wykonaj jeden wykres, na którym znajduję się trzy box-ploty dla zmiennych norm_sd1, norm_sd2, norm_sd3

norm_sd_all %>% 
  ggplot(aes(norm_sd,value,fill=norm_sd))+
  geom_boxplot()+
  theme_light()
  
