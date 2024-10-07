#******************************************************************************
# WILL HAVE TO CHANGE setwd TO YOUR OWN DIRECTORY IF NOT USING GITHUB ENVIRONMENT
#setwd("~/Desktop/School/Math 425 Applied Stats Models/MATH425-Assignment-3")
#******************************************************************************

data = read.csv("MATH425-Assignment-3/data/gpa-act.csv", header = T)
# x = ACT SCORE
x = data$act
# y = GPA
y = data$gpa

print(data)

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
# (c) Prepare a normal probability plot of the residuals(Q-Q)  to see if the 
#     residuals of data is normally distibuted
# If the points of the Q-Q plot follow the line, the residuals are normally 
# distributed, if the points deviate from the line it suggest non-normality
#qqnorm(resid(model))
#qqline(resid(model))
par(mfrow = c(2,2))
plot(model)

# ------------------------------------------------------------------------------
# (d) Test the normality
# To test the normality of the data we will use the Shapiro-Wilks test.
# H0: Population is distributed normally- Proved by P-Value >= 0.05
# Ha: Population is NOT distributed normally- Proved by P-Value < 0.05
# The P-Value = 0.0003304 inidcates that the hypothesis of normal errors is not
# reasonable.
shapiro.test(resid(model))

# ------------------------------------------------------------------------------
# (e) Conduct the Brown-Forsythe test to determine whether or not the error 
# variance varies with the level of X. Divide the data into the two groups, 
# X < 26, X >= 26 and use a=0.01 State the decision rule and conclusion. 
# Does your conclusion support your preliminary findings in part (b)
# The p-value is 0.3717, which is greater than 0.01, Based on this, we fail to 
# reject the null hypothesis. This means that there is no significant evidence 
# to suggest that the variances of the residuals differ between the two groups

# Step 1: Create a grouping variable based on ACT score (X < 26, X >= 26)
data$group <- ifelse(x < 26, "Group 1: X < 26", "Group 2: X >= 26")
data$group <- as.factor(data$group)
# Step 2: Use Levene's test with the 'group' variable for the Brown-Forsythe test.
leveneTest(resid(model) ~ data$group, center = "median")
