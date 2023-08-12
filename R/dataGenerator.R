set.seed(123)

data_generator <- function(n = 500) {
  Y <- rnorm(n, mean = 0, sd = 1)
  X1 <- 0.8 * Y + rnorm(n, mean = 0, sd = 0.3)
  X2 <- 0.9 * X1 + rnorm(n, mean = 0, sd = 0.1)
  X3 <- rnorm(n, mean = 0, sd = 1)
  data <- data.frame(Y, X1, X2, X3)

  return(data)
}
