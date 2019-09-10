# Project Euler problem 001:
# Find the sum of all the multiples of 3 or 5 below 1000.

vec <- 0
  
for (x in 1:999){
  
  if (x%%3 == 0 | x%%5 == 0) {
    vec <- c(vec,x)
  }
}

sum(vec)