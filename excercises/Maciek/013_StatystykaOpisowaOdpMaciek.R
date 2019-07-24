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
 
 