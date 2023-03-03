library(ISLR2)
library(boot)
library(caret)
library(dplyr)
library(tidyverse)


#Create Log model
glm1 = glm(Direction~ Lag1+ Lag2, data=Weekly, family=binomial)
summary(glm1)

#Create model using all but the first observation
glm2 = glm(Direction~ Lag1+ Lag2, data=Weekly,subset=2:1089, family=binomial)
summary(glm2)

#Try to predict the left out data point and compare to the actual observartion
contrasts(Weekly$Direction)
glmprobs=predict(glm2, Weekly[1,])
glmprobs
Weekly[1,]
#Yes, this point happens to have been correctly categorized

#Write a for loop from i=1 to i=n,where n is the number of observations in the data set, that performs each of the following steps:
#  i. Fit a logistic regression model using all but the ith obser- vation to predict Direction using Lag1 and Lag2.
#ii. Compute the posterior probability of the market moving up for the ith observation.
#iii. Use the posterior probability for the ith observation in order to predict whether or not the market moves up.
#iv. Determine whether or not an error was made in predicting the direction for the ith observation. If an error was made, then indicate this as a 1, and otherwise indicate it as a 0.

#Create vectors to be populated
predprob=c()
predDir=c()
error=c()
#create for loop
for(i in 1:1089) {
  glm = glm(Direction~ Lag1+ Lag2, data=Weekly[-i,], family=binomial)
  predprob[i] = predict(glm,Weekly[i,])
  predDir[i] = if(predprob[i] >=.5) "Up" else "Down"
  error[i] = if_else(predDir != Weekly[i,]$Direction,1,0)
}

#Compte LOOCV estimate of test error
test.error=sum(error)/length(error);test.error

#LOOCV Error says that the model is worse than guessing randomly