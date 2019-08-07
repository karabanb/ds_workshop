
# install.packages('corrplot')
library(corrplot)
head(iris)
cor(iris$Sepal.Width, iris$Petal.Width)

corr_matr <- cor(iris[, -5])

corrplot(corr_matr,method = 'number')
