set.seed(123)
source("C:/Users/Besitzer/Documents/myfirstpackage/R/AME.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/dataGenerator.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/mean_slopes.R")

library(cito)

rep = 500
out = rep(NA, rep)
n_predictors <- 50
eff <- matrix(NA, nrow = rep, ncol = n_predictors)
Width = 7

for(i in 1:rep){

  nn.fit <- dnn(Y~., data = data,
               epochs = 1, lr = 0.000000000000001, hidden = c(Width),
               plot = F)

  eff[i, ] = diag(marginalEffects(nn.fit, interactions = FALSE)$mean)

  out[i] = mean(predict(nn.fit))
}

hist(out)

store_mean_slope(mean_slope = mean(eff, na.rm = TRUE), depth = 1, width = Width)

save(out, file = "nn_1_7.Rdata")

save(eff, file = "eff_1_7.Rdata")

load("nn_1_7.Rdata")

load("results.Rdata")
