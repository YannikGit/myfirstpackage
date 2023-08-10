# library(MASS)
#
# set.seed(123)
#
# correlation <- 0.6
# n <- 100
# mean <- c(0, 0)
# sigma <- matrix(c(1, correlation, correlation, 1), ncol = 2)
#
#
# data <- matrix(0, n, 2)
# for (i in 1:n) {
#   temp_data <- mvrnorm(1, mu = mean, Sigma = sigma)
#   temp_data <- pnorm(temp_data)
#   data[i,] <- temp_data
# }
#
# colnames(data) <- c("x", "y")
# data <- as.data.frame(data)
# print(data)
# plot(data)
#
# x <- data[, 1]
# y <- data[, 2]
# real_correlation <- cor(x, y)
# print(real_correlation)



X = matrix(runif(100*50, -1, 1), 100, 50)
#X = matrix(runif(100), 100, 1)
Y = rnorm(100)
data = data.frame(Y,X)
#cor(X,Y)
