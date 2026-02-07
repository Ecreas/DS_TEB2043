weight <- as.numeric(readline("Enter your weight (kg): "))
height <- as.numeric(readline("Enter your height (m): "))

bmi <- weight / (height^2)

cat("Your BMI is:", round(bmi, 2), "\n")


if (bmi < 18.5) {
  cat("Status: Underweight\n")
} else if (bmi < 25) {
  cat("Status: Normal\n")
} else if (bmi < 30) {
  cat("Status: Overweight\n")
} else {
  cat("Status: Obese\n")
}
