set.seed(123)
source("C:/Users/Besitzer/Documents/myfirstpackage/R/AME.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/dataGenerator_Max.R")
source("C:/Users/Besitzer/Documents/myfirstpackage/R/mean_slopes.R")

library(cito)
library(dplyr)

results <- data.frame(hidden = numeric(),
                      X1_slope = numeric(),
                      X2_slope = numeric(),
                      X3_slope = numeric(),
                      X4_slope = numeric(),
                      X1_X2_variance = numeric(),
                      X1_X3_variance = numeric(),
                      X1_X4_variance = numeric(),
                      X2_X3_variance = numeric(),
                      X2_X4_variance = numeric(),
                      X3_X4_variance = numeric(),
                      meanPredict = numeric())

predictions <- data.frame(hidden = numeric(), Predictions = numeric())
slopes <- data.frame(hidden = numeric(), Slopes = numeric())


data <- simulate(r=0.9, n = 500, effs = c(1.0, 0.0, 1.0, 0.0))
cor(data)

w_vektor = c(numeric())
for (j in 1:15){
  w_vektor[j] = trunc(exp(j/2.6))
}

repititions = 100
n_predictors <- 4

for (w in w_vektor) {
  for(d in 1:10) {
    eff <- matrix(NA, nrow = repititions, ncol = n_predictors)
    out = rep(NA, repititions)
    for(i in 1:repititions){

      nn.fit <- dnn(Y~., data = data,
                    epochs = 300, lr = 0.01, hidden = c(rep(w, d)),
                    plot = F, early_stopping = 5)

      eff[i, ] = diag(marginalEffects(nn.fit, interactions = FALSE)$mean)

      out[i] = mean(predict(nn.fit))
    }

    results_new_row <- data.frame(hidden = paste("Depth:", d, "Width:", w),
                                  X1_slope = mean(eff[ ,1]),
                                  X2_slope = mean(eff[ ,2]),
                                  X3_slope = mean(eff[ ,3]),
                                  X4_slope = mean(eff[ ,4]),
                                  X1_X2_variance = var(eff[ ,1], y = eff[ ,2]),
                                  X1_X3_variance = var(eff[ ,1], y = eff[ ,3]),
                                  X1_X4_variance = var(eff[ ,1], y = eff[ ,4]),
                                  X2_X3_variance = var(eff[ ,2], y = eff[ ,3]),
                                  X2_X4_variance = var(eff[ ,2], y = eff[ ,4]),
                                  X3_X4_variance = var(eff[ ,3], y = eff[ ,4]),
                                  meanPredict = out)

    results = rbind(results, results_new_row)

    predictions_new_row <- data.frame(hidden = paste("Depth:", d, "Width:", w), Predictions = out)

    predictions = rbind(predictions, predictions_new_row)

    slopes_new_row <- data.frame(hidden = paste("Depth:", d, "Width:", w), Slopes = eff)

    slopes = rbind(slopes, slopes_new_row)


  }
}


results <- results[!duplicated(results$hidden), ]

save(results, file = "trained_results.Rdata")
save(slopes, file = "trained_slopes.Rdata")
save(predictions, file = "trained_predictions.Rdata")
