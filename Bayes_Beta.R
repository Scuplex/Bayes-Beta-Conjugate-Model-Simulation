# Bayes Beta estimator

T <- 600       # number of periods
theta <- 0.7      # true probability of success
y <- rbinom(T, size = 1, prob = theta) # random samples
ST <- sum(y)

a0 <- 1
b0 <- 1
aT <- a0 + ST
bT <- b0 + T - ST

posterior_mean  <- aT / (aT + bT) # Find the posterior_mean
mle <- ST / T # MLE calculation

x <- seq(0,1,length.out=400)
prior_density <- dbeta(x, a0, b0)
post_density  <- dbeta(x, aT, bT)

# Start the plot
plot(x, post_density,
     type = "l",
     col = "blue",
     lwd = 3,
     main = "Posterior vs Prior (BETA)",
     xlab = "(Probability of Success)",
     ylab = "Probability Density Function")

# Add the Prior Density
lines(x, prior_density, col = "black", lty = 2, lwd = 2)


# True theta
abline(v = theta, col = "darkgreen", lty = 1, lwd = 1.5)
# Posterior Mean (Bayes Estimator)
abline(v = posterior_mean, col = "red", lty = 3, lwd = 2)
# MLE
abline(v = mle, col = "orange", lty = 4, lwd = 1.5)


# Top left Banner
legend("topleft",
       legend = c(
         paste("Prior: Beta(", a0, ", ", b0, ")", sep = ""),
         paste("Posterior: Beta(", aT, ", ", bT, ")", sep = ""),
         paste("True θ = ", theta),
         paste("Posterior Mean = ", round(posterior_mean, 3)),
         paste("MLE = ", round(mle, 3))
       ),
       col = c("black", "blue", "darkgreen", "red", "orange"),
       lty = c(2, 1, 1, 3, 4),
       lwd = c(2, 3, 1, 2, 1.5),
       cex = 0.8
)


  