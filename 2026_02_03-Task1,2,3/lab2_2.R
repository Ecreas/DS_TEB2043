string1 <- readline("Enter first string: ")
string2 <- readline("Enter second string: ")


if (tolower(string1) == tolower(string2)) {
  cat("The strings are the same.\n")
} else {
  cat("The strings are not the same.\n")
}
