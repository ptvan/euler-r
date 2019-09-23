# Project Euler problem 002:
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, 
# find the sum of the even-valued terms.

fib <- function(upper){
  vec <- c(1,1,2)
  while (vec[length(vec)] < upper){
    val <- vec[length(vec)] + vec[length(vec)-1]
    if(val < upper){
      vec <- c(vec, val)
    } else {break}
  }
  return(vec)
}

vec <- fib(4e6)

sum(vec[vec%%2==0])