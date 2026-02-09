array1 <- array(c(1:24), dim = c(2,4,3) )
print(array1)


array2 <- array(c(25:54), dim = c(3,2,5))
print(array2)


cat("The second row of the second matrix of the array: ", array1[2,,2])
cat("The element in the 3rd row and 3rd column of the 1st matrix:", array2[3,3,1])
#the question ask for 3rd column in second array, which doesnt exist, so I assume it ask
#for second column instead based on the files given

cat("The element in the 3rd row and 2nd column of the 1st matrix:", array2[3,2,1])
