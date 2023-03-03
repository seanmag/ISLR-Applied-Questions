#Load Libraries
library(ISLR2)
library(boot)
library(caret)
library(dplyr)
library(tidyverse)


#Set Seed
set.seed(1243)
glm1 = glm(default~ income + balance, family=binomial, data=Default)
summary(glm1)
#std. error of the estimated coefficient of income is 4.985e-06
#std. error of the estimated coefficient of balance is 2.274e-04

#Create a function that returns estimated coefficients when tested on some subset of the data
boot.fn.log = function(df,index) {
    coef(glm(default~ income + balance, family=binomial, data=df, subset = index))
}


#Use boot to compute standard errors of the coefficients using simulated data
boot(Default, boot.fn.log, 100)
#First output
#ORDINARY NONPARAMETRIC BOOTSTRAP
#Call:
#  boot(data = Default, statistic = boot.fn.log, R = 100)
#Bootstrap Statistics :
#  original        bias     std. error
#t1* -1.154047e+01 -3.812123e-02 3.873948e-01
#t2*  2.080898e-05 -3.042546e-07 4.290111e-06
#t3*  5.647103e-03  2.682010e-05 2.127872e-04

#compare with st.d error of estimate
coef(glm(default~ income + balance, family=binomial, data=df, subset = index))

# We see a huge difference in the std. error of the intercept term, along with some change in the st. error of the variable terms (all three are smaller in the bootstrap metod)
