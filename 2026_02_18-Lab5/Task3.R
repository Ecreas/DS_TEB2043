check_armstrong <- function() {

  num <- as.integer(readline(prompt = "Check whether an n digits number is Armstrong or not: "))
  
  original <- num
  sum <- 0
  n <- nchar(as.character(num))  #raise to the power of how many digits in that number
  

  temp <- num
  while (temp > 0) {
    digit <- temp %% 10
    sum <- sum + digit^n
    temp <- floor(temp / 10) # if 153 divide by 10 get 15.3, so floor returns 15, and now loop back 
  }
  
  if (sum == original) {
    cat(original, "is an Armstrong number.\n")
  } else {
    cat(original, "is not an Armstrong number.\n")
  }
}

check_armstrong()
