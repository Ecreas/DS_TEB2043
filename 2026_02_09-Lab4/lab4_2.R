v1 = c(2,3,1,5,4,6,8,7,9) 

mat1 <- matrix(c(v1), nrow=3, byrow = FALSE)
print(matrix1)

mat2 <- t(matrix1)
print(matrix2)

cat("addition: \n")
print(mat1+mat2)

cat("subtraction: \n")
print(mat1-mat2)

cat("multiplication: \n")
print(mat1*mat2)

cat("division: \n")
print(mat1/mat2)




