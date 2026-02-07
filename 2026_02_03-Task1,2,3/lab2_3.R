name <- readline("Enter your name: ")
number<- readline("Enter your phone number: ")

name_capital <- toupper(name)

first3 <- substr(number, 1, 3)
last4 <- substr(number, nchar(number) - 3, nchar(number))

cat("Name:", name_capital, "\n")
cat("Phone Number:", paste(first3, "-XXX", last4, sep = ""), "\n")
