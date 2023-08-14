set.seed(123)
source("C:/Users/Besitzer/Documents/myfirstpackage/R/AME.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/dataGenerator.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/mean_slopes.R")

library(cito)

n = 500
data <- data_generator(n)

repititions = 5
out = rep(NA, repititions)
n_predictors <- 3

results <- initialize_results()

for (w in 1:10) {
  for(d in 1:3) {
    eff <- matrix(NA, nrow = repititions, ncol = n_predictors)
    for(i in 1:repititions){

      nn.fit <- dnn(Y~., data = data,
                    epochs = 1, lr = 0.000000000000001, hidden = c(rep(w, d)),
                    plot = F)

      eff[i, ] = diag(marginalEffects(nn.fit, interactions = FALSE)$mean)

      out[i] = mean(predict(nn.fit))
    }

    store_mean_slope(df = results, slope_data = eff, predict_data = mean(out), depth = d, width = w)

    save(out, file = paste0("out_", d, "_", w, ".Rdata"))

    save(eff, file = paste0("eff_", d, "_", w, ".Rdata"))
  }

}

load("results.Rdata")
load("eff_2_49.Rdata")
