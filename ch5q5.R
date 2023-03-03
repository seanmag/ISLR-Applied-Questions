#Load Libraries
library(ISLR2)
library(caret)
library(dplyr)
library(tidyverse)

#attach data
attach(Default)

#run log regression with dataset
Default=Default
glmfit1 = glm(default~ balance + income, data=Default, family=binomial)
summary(glmfit1)

#Validation approach

#Split the data set
indexset = sample(2, nrow(Default), replace = T) #Roughly 50% of rows will be assigned a value of 1
trainD= Default[c(indexset==1),]
testD= Default[c(indexset==2),]

#Fit the glmfit with the sample subset (makes model use those obsv identified in the sample function)
glmtrain = glm(default~ balance + income, data=Default, family=binomial)
summary(glmtrain)

#Predict glmtest with glmtrain model
glmprobs = predict(glmtrain, testD, type="response")

#check what we are predicting
contrasts(default)
#note: says No=0 and Yes=1 so we are predicting probabilty of default and not probability of no default

#Create a column for predicted classification
glmpred = rep("No", nrow(testD))
glmpred[glmprobs>.5] = "Yes"

#create a table to see test the results and find test error
table(glmpred, testD$default)
mean(glmpred != testD$default)

#repeat 3 times (Work to be done: CREATE A FOR or WHILE LOOP HERE track the size of each break, their number of observations that are yes and no etc.)
indexset1 = sample(2, nrow(Default), replace = T) 
indexset2 = sample(2, nrow(Default), replace =T)
indexset3 = sample(2, nrow(Default), replace =T)
trainD1 = Default[c(indexset1 ==1),]
testD1 = Default[c(indexset1 ==2),]
trainD2 = Default[c(indexset2 ==1),]
testD2 = Default[c(indexset2 ==2),]
trainD3 = Default[c(indexset3 ==1),]
testD3 = Default[c(indexset3 ==2),]

glmtrain1 = glm(default~ balance + income, data=trainD1, family=binomial)
glmprobs1 = predict(glmtrain1, testD1, type="response")
glmpred1 = rep("No", nrow(testD1))
glmpred1[glmprobs1>.5] = "Yes"

glmtrain2 = glm(default~ balance + income, data=trainD2, family=binomial)
glmprobs2 = predict(glmtrain2, testD2, type="response")
glmpred2 = rep("No", nrow(testD2))
glmpred2[glmprobs2>.5] = "Yes"

glmtrain3 = glm(default~ balance + income, data=trainD3, family=binomial)
glmprobs3 = predict(glmtrain3, testD3, type="response")
glmpred3 = rep("No", nrow(testD3))
glmpred3[glmprobs3>.5] = "Yes"

mean(glmpred1 != testD1$default)
mean(glmpred2 != testD2$default)
mean(glmpred3 != testD3$default)

means = c(mean(glmpred != testD$default), mean(glmpred1 != testD1$default), mean(glmpred2 != testD2$default), mean(glmpred3 != testD3$default))
names(means) = c("Val1", "Val2", "Val3","Val4")
means

#Now add a dummy variable, estimate the test error
glmtrain4 = glm(default~balance +income +student, data=trainD1, family=binomial)
glmprobs4 = predict(glmtrain4, testD1, type = 'response')
glmpred4 = rep("No", nrow(testD1))
glmpred4[glmprobs4>.5] = "Yes"
mean1 = mean(glmpred4 != testD1$default)

glmtrain5 = glm(default~balance +income +student, data=trainD, family=binomial)
glmprobs5 = predict(glmtrain5, testD2, type = 'response')
glmpred5 = rep("No", nrow(testD2))
glmpred5[glmprobs5>.5] = "Yes"
mean2 = mean(glmpred5 != testD2$default)

glmtrain6 = glm(default~balance +income +student, data=trainD3, family=binomial)
glmprobs6 = predict(glmtrain6, testD3, type = 'response')
glmpred6 = rep("No", nrow(testD3))
glmpred6[glmprobs6>.5] = "Yes"
mean3 = mean(glmpred6 != testD3$default)

means2 = c(mean1, mean2, mean3)
names(means2) = c("Val1", "Val2", "Val3")

#find that including the dummy variable makes an improvement (though I only tested 3 times)
