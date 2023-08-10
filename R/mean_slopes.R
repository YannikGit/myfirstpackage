store_mean_slope <- function(mean_slope, depth, width) {
  if (!exists("results")) {
    results <- data.frame(hidden = numeric(), mean_slopes = numeric())
  }

  new_row <- data.frame(hidden = paste("Depth:", depth, "Width:", width), mean_slopes = mean_slope)
  results <- rbind(results, new_row)

  save(results, file = "results.Rdata")
}


