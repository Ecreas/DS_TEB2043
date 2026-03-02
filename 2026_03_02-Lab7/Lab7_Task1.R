library(readxl)
library(dplyr)

titanic <- read.csv("titanic.csv") 
View(titanic)


sum(is.na(titanic))
which(is.na(titanic))


print(sapply(titanic, function(x) sum(is.na(x)))) 

dim(titanic)
titanic_cleaned = mutate(titanic, Age = ifelse(is.na(Age), mean(Age, na.rm = TRUE), Age))
View (titanic_cleaned)

colnames(titanic_cleaned)


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


