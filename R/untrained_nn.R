set.seed(123)
source("C:/Users/Besitzer/Documents/myfirstpackage/R/AME.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/dataGenerator.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/mean_slopes.R")

library(cito)
library(dplyr)

results <- data.frame(hidden = numeric(),
                      X1_slope = numeric(),
                      X2_slope = numeric(),
                      X3_slope = numeric(),
                      X1_X2_variance = numeric(),
                      X1_X3_variance = numeric(),
                      X2_X3_variance = numeric(),
                      meanPredict = numeric())

n = 500
data <- data_generator(n)
repititions = 500
n_predictors <- 3


for (w in 1:300) {
  for(d in 1:5) {
    eff <- matrix(NA, nrow = repititions, ncol = n_predictors)
    out = rep(NA, repititions)
    for(i in 1:repititions){

      nn.fit <- dnn(Y~., data = data,
                    epochs = 1, lr = 0.000000000000001, hidden = c(rep(w, d)),
                    plot = F)

      eff[i, ] = diag(marginalEffects(nn.fit, interactions = FALSE)$mean)

      out[i] = mean(predict(nn.fit))
      }

#    store_mean_slope(slope_data = eff, predict_data = mean(out), depth = d, width = w)
    new_row <- data.frame(hidden = paste("Depth:", d, "Width:", w),
                        X1_slope = mean(eff[ ,1]),
                        X2_slope = mean(eff[ ,2]),
                        X3_slope = mean(eff[, 3]),
                        X1_X2_variance = var(eff[ ,1], y = eff[ ,2]),
                        X1_X3_variance = var(eff[ ,1], y = eff[ ,3]),
                        X2_X3_variance = var(eff[ ,2], y = eff[ ,3]),
                        meanPredict = out)
    results = rbind(results, new_row)

    save(out, file = paste0("out_", d, "_", w, ".Rdata"))

    save(eff, file = paste0("eff_", d, "_", w, ".Rdata"))

    }
}

results <- results[!duplicated(results$hidden), ]

save(results, file = "results.Rdata")
load("results.Rdata")
