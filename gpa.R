#******************************************************************************
# WILL HAVE TO CHANGE setwd TO YOUR OWN DIRECTORY IF NOT USING GITHUB ENVIRONMENT
#setwd("~/Desktop/School/Math 425 Applied Stats Models/MATH425-Assignment-3")
#******************************************************************************

data = read.csv("MATH425-Assignment-3/data/gpa-act.csv", header=T)
# x = ACT SCORE
x = data$act
# y = GPA
y = data$gpa

# ------------------------------------------------------------------------------
# (a) Prepare a box plot for the ACT scores 𝑋𝑖. Are there any noteworthy 
#     features in this plot?
# The boxplot shows Q1 (28-35), Interquartile Q2 from (22-28), Q1 (14-22), and 
# mean = 25
boxplot(data$act, main = "Boxplot of ACT Scores", ylab = "ACT Scores")

# ------------------------------------------------------------------------------
# (a) Prepare a box plot for the ACT scores 𝑋𝑖. Are there any noteworthy 
#     features in this plot?
# The boxplot shows Q1 (28-35), Interquartile Q2 from (22-28), Q1 (14-22), and 
# mean = 25