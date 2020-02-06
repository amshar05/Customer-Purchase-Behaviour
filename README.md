In order to do this homework you need to go to Kaggle website and create a user account (which is free) and download Black Friday dataset.

https://www.kaggle.com/mehdidag/black-friday

Description

The dataset here is a sample of the transactions made in a retail store. The store wants to know better the customer purchase behaviour against different products. Specifically, here the problem is a regression problem where we are trying to predict the dependent variable (the amount of purchase) with the help of the information contained in the other variables. Dataset of more than 500000 observations about the black Friday in a retail store, it contains different kinds of variables either numerical or categorical.

User_ID | User ID

Product_ID | Product ID

Gender | Sex of User

Age | Age in bins

Occupation | Occupation

City_Category | Category of the City (A,B,C) 

Stay_In_Current_City_Years | Number of years stay in current city 

Marital_Status | Marital Status

Product_Category_1 | Product Category

Product_Category_2 | Product may belongs to other category also 

Product_Category_3 | Product may belongs to other category also 

Purchase | Purchase Amount

Your hw has two parts. First part requires building a linear regression model, second part requires building a classification model.

PART 1- Linear Regression & Cross Validation

Q1) Use set.seed(8). Divide the data set into training set (80% of the data) and test_set (20%)

Q2) Build a linear regression model to predict Purchase using predictors Gender, Age, Occupation,City_Category, Stay_In_Current_City_Years, Marital_Status, Product_Category_1.
Do not use other variables and make sure categorical variables are considered as “factor” before you build the model

Q3) Which variables are significant predictors of Purchase?

Q4) Predict Purchase amount using the model you built separately for training set and test set. Calculate the Square root of Mean Square Errors for training and test set predictions. Test set RMSE (root mean squared error) will be the holdout error value.

Q5) Using cv.glm function, perform a 5-fold cross validation on Black Friday data set using the same predictors and response indicated above in Question2. Calculate cross validation RMSE and compare to the value you found in Q4 using holdout method. Which method would you prefer?
 
PART 2: Logistic Regression

Use set.seed(9) and only holdout method for this analysis -80:20 ratio again for train and test sets

Q6) Create a histogram of Product_Category_1

Q7) Create a table that shows the counts(frequency) of each Product_Category_1 using table() function). How many different categories were observed in this variable in BlackFriday data set?

Q8) Using the output from Q7 above, calculate the probability of occurrence of each level in Product_category_1. 

Q9) Determine the levels of Product_category_1 which has lower than 0.03 probability of occurrence, and consider
these levels as “low probability levels”.

Q10) Create a new variable that takes the value of 0 if an observation’s Product_category_1 level belongs to the “low probability group” described above in Q9. If the level does not belong to the low probability group, new variable will take the value of 1. Add this newly created binary variable to BlackFriday data set

Q11) Build a logistic regression model that predicts whether a purchase will belong to a low probability level or not. Use predictors Gender,Age,Occupation,City_Category,Stay_In_Current_City_Years,Marital_Status,Purchase

Q12) Calculate Test set misclassification rate and accuracy of your model using different threshold(cutoff) probabilities. Which cutoff value would you choose? Why?

