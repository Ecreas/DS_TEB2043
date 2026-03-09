library(readxl)
library(dplyr)
library(plotrix)

titanic <- read.csv("titanic.csv") 
View(titanic)


sum(is.na(titanic))
which(is.na(titanic))


print(sapply(titanic, function(x) sum(is.na(x)))) 

dim(titanic)

titanic_cleaned <- titanic %>%
  mutate(
    Age = ifelse(is.na(Age), mean(Age, na.rm = TRUE), Age),
    Age = as.integer(round(Age))
  )

View (titanic_cleaned)

print(filter(titanic_cleaned,Sex == 'female')) 
print(filter(titanic_cleaned,Fare > 500)) 
print(filter(titanic_cleaned,Sex == 'female' & Fare > 500)) 

titanic_sortbyfare = arrange(titanic_cleaned, Fare) 
View(titanic_sortbyfare)

totalSurvived <- sum(titanic_cleaned$Survived == 1)
print(totalSurvived)

genderCount <- titanic_cleaned %>%
  group_by(Sex)
summarise(Total = n())


cat("\n Box Plot - Fare by Passenger Class:\n")
boxplot(Fare ~ Pclass, data = titanic_cleaned,
        xlab = "Passenger Class",
        ylab = "Fare",
        main = "Fare Distribution by Passenger Class",
        col = c("lightblue", "lightgreen", "lightyellow"))

cat("\n Basic Pie Chart - Gender Distribution:\n")
gender_counts <- table(titanic_cleaned$Sex)
pie(gender_counts, labels = names(gender_counts))
title("Gender Distribution on Titanic")
