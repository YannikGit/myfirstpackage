source("C:/Users/Besitzer/Documents/myfirstpackage/R/AME.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/dataGenerator_Max.R")
data <- simulate(r=0.9, n = 500, effs = c(1.0, 0.0, 1.0, 0.0))
data <- as.data.frame(data)


lm <- lm(Y ~ X1 + X2 + X3 + X4, data = data)

lm

pairs(~ Y + X1 + X2 + X3 + X4, data= data)
cor(data)
cov(data)
