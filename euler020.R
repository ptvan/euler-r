# Project Euler problem 020
# Find the sum of the digits in the number 100!

# once again, with modern libraries, this problem is trivial
library(gmp)
bigNum <- factorialZ(100)
sum(as.numeric(unlist(strsplit(as.character(bigNum), ""))))