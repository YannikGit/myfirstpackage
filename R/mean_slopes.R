store_mean_slope <- function(slope_data, predict_data, depth, width) {
  if (!exists("results")) {
    results <- data.frame(hidden = numeric(),
                          X1_slope = numeric(),
                          X2_slope = numeric(),
                          X3_slope = numeric(),
                          X1_X2_variance = numeric(),
                          X1_X3_variance = numeric(),
                          X2_X3_variance = numeric(),
                          meanPredict = numeric())
  }


  new_row <- data.frame(hidden = paste("Depth:", depth, "Width:", width),
                       X1_slope = mean(slope_data[ ,1]),
                        X2_slope = mean(slope_data[ ,2]),
                       X3_slope = mean(slope_data[, 3]),
                       X1_X2_variance = var(slope_data[ ,1], y = slope_data[ ,2]),
                       X1_X3_variance = var(slope_data[ ,1], y = slope_data[ ,3]),
                       X2_X3_variance = var(slope_data[ ,2], y = slope_data[ ,3]),
                       meanPredict = predict_data)

  results <- rbind(results, new_row)

  save(results, file = "results.Rdata")
}


