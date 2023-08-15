set.seed(123)
source("C:/Users/Besitzer/Documents/myfirstpackage/R/AME.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/dataGenerator.R")

n = 500
data <- data_generator(n)

lm <- lm(Y ~ X1 + X2 + X3, data = data)
print(lm)

lmx <- lm(X1 ~ X2 + X3 + Y, data = data)
print(lmx)
