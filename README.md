# ISLR-Applied-Questions
This repository contains my attempts at solving the open ended applied exercises in the ISLR book


Question Index 
chp5q5
5. In Chapter 4, we used logistic regression to predict the probability of default using income and balance on the Default data set. We will now estimate the test error of this logistic regression model using the validation set approach. Do not forget to set a random seed before beginning your analysis.
(a) Fit a logistic regression model that uses income and balance to predict default.
(b) Using the validation set approach, estimate the test error of this model. In order to do this, you must perform the following steps:
i. Split the sample set into a training set and a validation set.
ii. Fit a multiple logistic regression model using only the train-
ing observations.
iii. Obtain a prediction of default status for each individual in
the validation set by computing the posterior probability of default for that individual, and classifying the individual to the default category if the posterior probability is greater than 0.5.
iv. Compute the validation set error, which is the fraction of the observations in the validation set that are misclassified.
(c) Repeat the process in (b) three times, using three different splits of the observations into a training set and a validation set. Com- ment on the results obtained.
(d) Now consider a logistic regression model that predicts the prob- ability of default using income, balance, and a dummy variable for student. Estimate the test error for this model using the val- idation set approach. Comment on whether or not including a dummy variable for student leads to a reduction in the test error rate.

chp5q6
6. We continue to consider the use of a logistic regression model to predict the probability of default using income and balance on the Default data set. In particular, we will now compute estimates for the standard errors of the income and balance logistic regression co- efficients in two different ways: (1) using the bootstrap, and (2) using the standard formula for computing the standard errors in the glm() function. Do not forget to set a random seed before beginning your analysis.
(a) Using the summary() and glm() functions, determine the esti- mated standard errors for the coefficients associated with income and balance in a multiple logistic regression model that uses both predictors.
(b) Writeafunction,boot.fn(),thattakesasinputtheDefaultdata set as well as an index of the observations, and that outputs the coefficient estimates for income and balance in the multiple logistic regression model.
(c) Usetheboot()functiontogetherwithyourboot.fn()functionto estimate the standard errors of the logistic regression coefficients for income and balance.
(d) Comment on the estimated standard errors obtained using the glm() function and using your bootstrap function.

chp5q7
7. In Sections 5.3.2 and 5.3.3, we saw that the cv.glm() function can be used in order to compute the LOOCV test error estimate. Alterna- tively, one could compute those quantities using just the glm() and predict.glm() functions, and a for loop. You will now take this ap- proach in order to compute the LOOCV error for a simple logistic regression model on the Weekly data set. Recall that in the context of classification problems, the LOOCV error is given in (5.4).
(a) FitalogisticregressionmodelthatpredictsDirectionusingLag1 and Lag2.
(b) FitalogisticregressionmodelthatpredictsDirectionusingLag1 and Lag2 using all but the first observation.
(c) Use the model from (b) to predict the direction of the first obser- vation. You can do this by predicting that the first observation will go up if P(Direction="Up"|Lag1,Lag2) > 0.5. Was this observation correctly classified?
(d) Writeaforloopfromi=1toi=n,wherenisthenumberof observations in the data set, that performs each of the following steps:
i. Fit a logistic regression model using all but the ith obser- vation to predict Direction using Lag1 and Lag2.
ii. Compute the posterior probability of the market moving up for the ith observation.
iii. Use the posterior probability for the ith observation in order to predict whether or not the market moves up.
iv. Determine whether or not an error was made in predicting the direction for the ith observation. If an error was made, then indicate this as a 1, and otherwise indicate it as a 0.
(e) Take the average of the n numbers obtained in (d)iv in order to obtain the LOOCV estimate for the test error. Comment on the results.
