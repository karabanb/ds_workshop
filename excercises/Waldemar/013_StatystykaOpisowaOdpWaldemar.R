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

# coefficient of variation - wspolczynnik zmiennosci

library(sjstats)

cv(norm_sd1)
cv(norm_sd2)
cv(norm_sd3)

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


# zadanie 2

iq_n100 <- rnorm(100,mean=100,sd=15)
iq_n10000 <- rnorm(10000,mean=100,sd=15)
iq_n1000000 <- rnorm(1000000,mean=100,sd=15)


sigma_three <- function(x){
  sigma1=length(which(x>(mean(x)+sd(x))|x<(mean(x)-sd(x))))/length(x)*100
  sigma2=length(which(x>(mean(x)+2*sd(x))|x<(mean(x)-2*sd(x))))/length(x)*100
  sigma3=length(which(x>(mean(x)+3*sd(x))|x<(mean(x)-3*sd(x))))/length(x)*100
  out_of_sigma <- data.frame(sigma1,sigma2,sigma3)
  print(out_of_sigma)
}

sigma_three(iq_n100)
sigma_three(iq_n10000)
sigma_three(iq_n1000000)

# WNIOSEK: dla kazdego z wektorow zasada trzech sigma jest zachowana 68,2% obserwacji w przedziale [μ–σ,μ+σ], 
#          95,4% w przedziale [μ–2σ,μ+2σ] oraz 99,7% w przedziale [μ–3σ,μ+3σ]


# wartosc 10 percentyla, 1 kwartyla, 3 kwartyla i 90 percentyla dla każdego z wektorów
quantile(iq_n100,c(.1,.25,.75,.9))
quantile(iq_n10000,c(.1,.25,.75,.9))
quantile(iq_n1000000,c(.1,.25,.75,.9))

# WNIOSEK: ze wzrostem proby uzyskane wyniki sa blizsze wartosciom dla skali Wechslera

# Sprawdź na wektorze iq_n1000000 jaki procent obserwacji ma: iq < 80, iq < 100, iq < 115 i iq > 140

length(which(iq_n1000000<80))/length(iq_n1000000)*100 # 9,1%
length(which(iq_n1000000<100))/length(iq_n1000000)*100 # 49,9%
length(which(iq_n1000000<115))/length(iq_n1000000)*100 # 84.1%
length(which(iq_n1000000>140))/length(iq_n1000000)*100 #0.39

# Umieść wykresy gęstości (rozkłady) wszystkich trzech wektorów na jednym wykresie

iq_n100_df <- data.frame("value"=iq_n100,"vector"="iq_n100")
iq_n10000_df <- data.frame("value"=iq_n10000,"vector"="iq_n10000")
iq_n1000000_df <- data.frame("value"=iq_n1000000,"vector"="iq_n1000000")

iq_n_all <- rbind(iq_n100_df,iq_n10000_df,iq_n1000000_df)

iq_n_all %>% 
  ggplot(aes(value,color=vector))+geom_density()+
  theme_light()

# WNIOSEK: rozklady sa zblizone do siebie

# zadanie 3 

head(iris)

multi.fun <- function(x){
  c(sd=sd(x),var=var(x))
}

sapply(iris[,1:4],multi.fun)
# or
apply(iris[,1:4],2,multi.fun)

# WNIOSEK: najwieksza zmiennoscia charakteryzuje sie zmienna Petal.Length

iris %>% 
  group_by(Species) %>% 
  summarise(var(Sepal.Length),
            sd(Sepal.Length),
            var(Sepal.Width),
            sd(Sepal.Width),
            var(Petal.Length),
            sd(Petal.Length),
            var(Petal.Width),
            sd(Petal.Width)) 
  #gather(key="variable",value="value",-Species) %>% 
  #filter(value==max(value))

iris %>% group_by(Species) %>% 
  summarise_all(sd)

# Wniosek: Sepal.Length - virginica, Sepal.Width - setosa, Petal.Length - virginica, Petal.Width - virginica

 
