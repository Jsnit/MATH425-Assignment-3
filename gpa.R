#******************************************************************************
# WILL HAVE TO CHANGE setwd TO YOUR OWN DIRECTORY IF NOT USING GITHUB ENVIRONMENT
#setwd("~/Desktop/School/Math 425 Applied Stats Models/MATH425-Assignment-3")
#******************************************************************************

data = read.csv("MATH425-Assignment-3/data/gpa-act.csv", header=T)
# x = ACT SCORE
x = data$act
# y = GPA
y = data$gpa

model = lm(y~x, data=data)

# ------------------------------------------------------------------------------
# (a) Prepare a box plot for the ACT scores 𝑋𝑖. Are there any noteworthy 
#     features in this plot?
# The boxplot shows Q1 (28-35), Interquartile Q2 from (22-28), Q1 (14-22), and 
# mean = 25
boxplot(data$act, main = "Boxplot of ACT Scores", ylab = "ACT Scores")

# ------------------------------------------------------------------------------
# (b) Plot the residual ei against the fitted values(Y-Hat i), What departures 
#     from simple linear regression model can be studied from this plot? 
#     What are your findings?
# From the fitted vs residuals plot we can check:
# -Linearity of the data (If there is a non-linear pattern in this plot, it
#  suggests the relationship between X and Y isn't linear)
# -Variance of the data (If the spread in the data increases or decreases with 
#  the fitted values [Y-hat], The there is non-constant variance)
# -Outliers of the data appear as points far away from the rest of the residuals
# From this plot, I found that the relation between X & Y is linear, 
# the variance of the data is relatively constant through, and the
# data has a few outliers.
plot(fitted(model), resid(model), ylab = "Residuals", xlab = "Fitted Values")
abline(h=0)

# ------------------------------------------------------------------------------
# (c) Prepare a normal probability plot (Q-Q) of the residuals to see if the data is
#     normally distibuted
par(mfrow = c(2,2))
plot(model)
