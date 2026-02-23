student_scores = data.frame(
  
  names = c("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kevin", "Jonas"),
  score = c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0),
  attempts = c(1,3,2,3,2,1,2)
  
)

print(student_scores)

student_scores$qualify <- c("yes","no", "yes", "no", "no", "no", "yes")

print(student_scores)

new_row = data.frame(
  
  names = "Emily",
  score = 14.5,
  attempts = 1,
  qualify = "yes"
  
)

new_student_scores = rbind(student_scores, new_row)

print(new_student_scores)

str(new_student_scores)
summary(new_student_scores)
cat("number of rows: ", nrow(new_student_scores))
cat("number of columns: ", ncol(new_student_scores))

#the score min value is 8.0 and the max is 19.0, with the mean is about 12.56
#4 students has qualified and 4 didnt
#it seems scores 12.0 and below didn't qualify
#the dataset is small


