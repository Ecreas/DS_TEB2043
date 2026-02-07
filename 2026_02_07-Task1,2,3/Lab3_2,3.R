students <- list(
  names = c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt",
           "Larson", "Holland", "Paul", "Simu", "Renner"),
  scores = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
)


max <- max(students$scores)
min <- min(students$scores)
mean <- mean(students$scores)
highscore <- which.max(students$scores)
lowscore <- which.min(students$scores)


cat("Highest score: ", max )
cat("Lowest score: ", min )
cat("Average score: ", mean )
cat("Student with highest score: ", students$names[highscore])
cat("Student with lowest score:  ", students$names[lowscore])



#task3-extension of task2
students$Chemistry <- c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
students$Physics   <- c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)

chem_fail_count <- sum(students$Chemistry <= 49)
chem_fail_count

phy_fail_count <- sum(students$Physics <= 49)
phy_fail_count


chemHigh <- which.max(students$Chemistry)
chemHighName <- students$names[chemHigh]

phyHigh <- which.max(students$Physics)
phyHighName <- students$names[phyHigh]
