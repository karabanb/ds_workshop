### Zadanie 1

?rnorm


# wygeneruj 3 wektory wartości o rozkładzie normalnym , liczba obs - 1000 ; mean = 0 ; odchylenie st - 1 , 2 , 3
norm_sd1 <- rnorm(1000, mean = 0, sd = 1)
norm_sd2 <- rnorm(1000, mean = 0, sd = 2)
norm_sd3 <- rnorm(1000, mean = 0, sd = 3)

# Dla każdego z wektorów, oblicz wszytskie poznane przez Ciebie miary zmienności.

#Rozstęp (range) - różnica pomiędzy największą na najmniejszą zaobserwowaną wartością.

range(norm_sd1)
range(norm_sd2)
range(norm_sd3)

#Rozstęp międzykwartylowy (Interquartile range, IQR) - różnica pomiędzy wartością
#pierwszego i trzeciego kwartyla.

IQR(norm_sd1)
IQR(norm_sd2)
IQR(norm_sd3)

#wariancja
var(norm_sd1)
var(norm_sd2)
var(norm_sd3)

#odchylenie standardowe
sd(norm_sd1)
sd(norm_sd2)
sd(norm_sd3)

#srednia
mean(norm_sd1)
mean(norm_sd2)
mean(norm_sd3)

#mediana
median(norm_sd1)
median(norm_sd2)
median(norm_sd3)

#wspolczynnik zmiennosci
coe <- function (x) {
  sd(x) / mean (x) * 100
}

 coe(norm_sd1) 
 coe(norm_sd2)
 coe(norm_sd3)
 
#Wykonaj jeden wykres, na którym znajdują się trzy rozkłady dla zmiennych `norm_sd1`, `norm_sd2`, `norm_sd3`.
 plot(density(myData, bw=3), las = 1)

 #using R base
 plot (density(norm_sd1))
 lines (density(norm_sd2))
 lines (density(norm_sd3))
 
 #using ggplot
 library(ggplot2)
 x <- data.frame(norm_sd1, norm_sd2, norm_sd3)
 library(reshape2)
 data <- melt(x)
 ggplot(data,aes(x=value, fill=variable)) + geom_density(alpha=0.25)
 

#Wykonaj jeden wykres, na którym znajduję się trzy box-ploty dla zmiennych `norm_sd1`, `norm_sd2`, `norm_sd3`.
boxplot(norm_sd1, norm_sd2, norm_sd3, col="grey", horizontal = TRUE)


### Zadanie 2

#tworzenie wektorów o rozkładzie normalnym
iq_n100 <- rnorm(100, mean = 100, sd = 15)
iq_n10000 <- rnorm(10000, mean = 100, sd = 15)
iq_n1000000 <- rnorm(1000000, mean = 100, sd = 15)

#odleglosc 3 sigma (3 odch stand od sredniej)
#TRUE - wszystkie wyniki w przedziale 3 sigma
max(iq_n100) < mean(iq_n100) + 3 * sd(iq_n100)
min(iq_n100) > mean(iq_n100) - 3 * sd(iq_n100)

#37 wynikow (~0,37%) poza przedzialem 3 sigma
length(which(iq_n10000 < mean(iq_n10000) + 3 * sd(iq_n10000) & iq_n10000 > mean(iq_n10000) - 3 * sd(iq_n10000))) 

#2724 wynikow (~0,27%) poza przedzialem 3 sigma
length(which(iq_n1000000 < mean(iq_n1000000) + 3 * sd(iq_n1000000) & iq_n1000000 > mean(iq_n1000000) - 3 * sd(iq_n1000000))) 

#percyntyle
#10 percentyl, 1 kwartyl, 3 kwartyl i 90 percentyl
quantile(iq_n100, c(.10,.25,.75,.90))
quantile(iq_n10000, c(.10,.25,.75,.90))
quantile(iq_n1000000, c(.10,.25,.75,.90))

#wartosci wechslera , perc10 - 80 ; perc25 - 90 ; perc75 - 110 ; perc90 - 120
#wartosci percyntyli wektorow 2 i 3 - pokrywaja sie z IQ Weschlera (dla SD=15) dla vinci society ?


#Sprawdź na wektorze `iq_n1000000` jaki procent obserwacji ma: iq < 80, iq < 100, iq < 115 i iq > 140
length(which(iq_n1000000 < 80)) / 1000000 *100 
length(which(iq_n1000000 < 100)) / 1000000 *100 
length(which(iq_n1000000 < 115)) / 1000000 *100 
length(which(iq_n1000000 > 140)) / 1000000 *100 

#0.09% obserwacji ponizej iq < 80 ; 49.98% obserwacji ponizej iq < 100 ; 84,2% ponizej 115 ; 0,38 % powyzej 140

#Umieść wykresy gęstości (rozkłady) dla 3 wektorow

library(ggplot2)
install.packages('plotly')
library(plotly)
vec1 <- data.frame(length = iq_n100)
vec2 <- data.frame(length = iq_n10000)
vec3 <- data.frame(length = iq_n1000000)

vec1$veg <- 'vec1'
vec2$veg <- 'vec2'
vec3$veg <- 'vec3'
                   
vegLengths <- rbind(vec1, vec2, vec3)
p <- ggplot(vegLengths, aes(length, fill = veg)) + geom_density(alpha = 0.5)
ggplotly(p)


### Zadanie 3

head(iris)
summary(iris)

apply(iris,2,var)
#petal.length ma najwiekszy rozrzut zmiennej

iris %>% group_by(Species)
str(iris)
