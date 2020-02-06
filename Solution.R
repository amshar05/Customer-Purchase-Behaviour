#ISE240 

#Q1###############################
kaggle<- read.csv(file.choose("bf.csv"))
set.seed(8)
dt = sort(sample(nrow(kaggle), nrow(kaggle)*0.8))
train<-kaggle[dt,]
test<-kaggle[-dt,]
train
test

#Q2######################################################################
Marital_Status_factor = factor(train$Marital_Status)
is.factor(Marital_Status_factor)
Gender_factor = factor(train$Gender)
is.factor(Gender_factor)
Age_factor = factor(train$Age)
is.factor(Age_factor)
City_Category_factor = factor(train$City_Category)
is.factor(City_Category_factor)
Stay_In_Current_City_Years_factor = factor(train$Stay_In_Current_City_Years)
is.factor(Stay_In_Current_City_Years_factor)
occupation_factor = factor(train$Occupation)
is.factor(occupation_factor)
product_category = factor(train$Product_Category_1)
is.factor(product_category)

lm.fit=lm(Purchase~Gender+Age+Occupation+City_Category+Stay_In_Current_City_Years+Marital_Status+Product_Category_1,data=train)
summary(lm.fit)

#Q4#########################################
new_train = data.frame(subset(train,select =c(Gender, Age, Occupation,City_Category,Stay_In_Current_City_Years,Marital_Status,Product_Category_1)))
x_train = data.frame(predict(lm.fit, new_train))
y_train = c(train$Purchase)
colnames(x_train)
RMSE_train = sqrt(sum((x_train$predict.lm.fit..new_train. - y_train)^2)/length(y_train))
RMSE_train

new_test = data.frame(subset(test,select =c(Gender, Age, Occupation,City_Category,Stay_In_Current_City_Years,Marital_Status,Product_Category_1)))
x_test = data.frame(predict(lm.fit, new_test))
colnames(x_test)
y_test = c(test$Purchase)
RMSE_test = sqrt(sum((x_test$predict.lm.fit..new_test. - y_test)^2)/length(y_test))
RMSE_test

#Q5###########################################################################
#Gender, Age, Occupation,City_Category,Stay_In_Current_City_Years, Marital_Status, Product_Category_1

set.seed(8)
cv.error.5=rep(0,5)
library(boot)
for (i in 1:5){
  glm.fit=glm(Purchase~Occupation+Product_Category_1+Stay_In_Current_City_Years+Marital_Status+Gender+Age+City_Category,data=kaggle)
  cv.error.5[i]=cv.glm(kaggle,glm.fit,K=5)$delta[1]   
  }
cv.error.5

#part 2##########################################################

set.seed(9)
dr = sort(sample(nrow(kaggle), nrow(kaggle)*0.8))
train_1<-kaggle[dr,]
test_1<-kaggle[-dr,]
train_1
test_1
#Q6##################################################
J<-hist(kaggle$Product_Category_1)
k<-hist(train$Product_Category_1)
h<-hist(test$Product_Category_1)

#Q7##########################################################

prod = data.frame(table(Product_Category_1))
prod

#Q8###########################################################

prod$prob = data.frame((prod$Freq)/sum(prod$Freq))
prod$prob

#Q9##########################################################

predic<-ifelse(prod$prob>0.03,"1","0")
predic


#10#############################################  
my_vector = c()
for(i in 1:537577){my_vector=c(my_vector,predic[kaggle$Product_Category_1[i]])
print(my_vector)
}
my_vector
kaggle$probability = my_vector
kaggle$probability  
kaggle

#Q11#################################################################################

fac = factor(train_1$probability)
is.factor(fac)
train_1$probability <- as.numeric(train_1$probability)
log_reg = glm(probability~Gender+Age+Occupation+City_Category+Stay_In_Current_City_Years+Marital_Status+Purchase, family= "binomial", data= train_1)
log_reg
summary(log_reg)


#12#############################################################

predicted_default_prob<-predict(log_reg,newdata = test_1, type="response") #predict probabilities for all observations in the data
max(predicted_default_prob)
min(predicted_default_prob)

#case 1
predicted_default_1<-ifelse(predicted_default_prob > 0.87,"Yes","No") # convert probabilities to class labels
table(test_1$probability,predicted_default_1)
mean(predicted_default_prob!= test_1$probability)
misclassification_1 = (10240+12)/(10240+12+9+97255)
misclassification_1
accuracy_1 = (9+97255)/(10240+12+9+97255)
accuracy_1

#case 2
predicted_default_2<-ifelse(predicted_default_prob > 0.88,"Yes","No") # convert probabilities to class labels
table(test_1$probability,predicted_default_2)
misclassification_2 = (9927+1900)/(9927+1900+322+95367)
misclassification_2
accuracy_2 = (322+95367)/(9927+1900+322+95367)
accuracy_2

#case3
predicted_default_3<-ifelse(predicted_default_prob > 0.89,"Yes","No") # convert probabilities to class labels
table(test_1$probability,predicted_default_3)
misclassification_3 = (8332+14523)/(8332+14523+1917+82744)
misclassification_3
accuracy_3 = (1917+82744)/(8332+14523+1917+82744)
accuracy_3

#case4
predicted_default_4<-ifelse(predicted_default_prob > 0.93,"Yes","No") # convert probabilities to class labels
table(test_1$probability,predicted_default_4)
misclassification_4 = (6+97256)/(6+97256+10243+11)
misclassification_4
accuracy_4 = (10243+11)/(6+97256+10243+11)
accuracy_4
