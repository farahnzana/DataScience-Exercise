#week8
#upload data

student_data<- read.csv("C:/Users/User/OneDrive/Documents/student_data.csv")
View(student_data)

Student_fail<-Student_fail<-student_data[student_data$final_exam_mark< 40,]

library(dplyr)
mydata1<-student_data %>% filter(final_exam_mark> 40) %>% arrange(desc(final_exam_mark))
View(mydata1)

mydata1<- student_data %>% filter(final_exam_mark< 40) %>% arrange(desc(final_exam_mark))
View(mydata1)

mydata2<- student_data %>% filter(final_exam_mark< 40) %>% arrange(final_exam_mark)
View(mydata2)

mydata2 <- student_data%>% select(student_id,coursework_mark,final_exam_mark)
View(mydata2)

mydata4 = student_data%>% mutate(Total_Mark=(coursework_mark+ final_exam_mark/200*100))
View(mydata4)

#Descriptive Statistics_________________________________________ 
data(iris)

min(iris$Sepal.Length) #this produces 4.3
max(iris$Sepal.Length) #this produces 7.9

range(iris$Sepal.Length)

sd(iris$Sepal.Length)

A<-c(170.2, 181.5, 188.9, 163.9, 166.4, 163.7, 160.4, 175.8, 181.5)
Sort_A<-sort(A)
quantile(A,0.25)
quantile(A,0.75)

hist (iris$Sepal.Length,
     main = "Histogram of Sepal Length“,
     xlab = "Sepal Length (cm)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

data <- c(30,24,26,28,29,28,27,26,32,34,13,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)

boxplot(data, main = "Boxplot")
     
first_q<-quantile(data,0.25) #this is 26
third_q<-quantile(data,0.75) #this is 31.75  
iqr<-IQR(data) #this produces 5.75     
iqr<-IQR(data)
 
le<-first_q - 1.5 * iqr     
ue<-third_q+ 1.5 * iqr     
   
data_new<-data
data_new<- data_new[!data_new<le]
data_new<- data_new[!data_new>ue]
data_new  

data_new<- data
avg <- round(mean(data_new))#for the purpose of example we round up value
data_new[data_new<le] <- avg
data_new[data_new>ue] <- avg
data_new     

data_new<- data
data_new[data_new<le] <- le
data_new[data_new>ue] <- ue
data_new     

boxplot(data_new, main = "Boxplot")     

#exercise 8-------------------------------------------------

#q1
student_data %>% filter(final_exam_mark > 80)

#q2
student_data %>% arrange(coursework_mark)
     
#q3
student_data %>% select(student_name, final_exam_mark)

#q4
nrow(student_data) 
ncol(student_data)
     
#q5
str(student_data)
summary(student_data)
head(student_data)
View(student_data)

#q6
# Step 1: Calculate quartiles and IQR
Q1 <- quantile(student_data$final_exam_mark, 0.25)
Q3 <- quantile(student_data$final_exam_mark, 0.75)
IQR_value <- IQR(student_data$final_exam_mark)

# Step 2: Calculate lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

# Step 3: Identify the outliers
outliers <- student_data %>% filter(final_exam_mark < lower_bound | final_exam_mark > upper_bound)

outliers
nrow(outliers)     
     
     