# Project Euler problem 025 :
# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

# Note that the problem asks for the *index* of the number, not the number itself
# but computers are fast enough that we can solve via brute-force:

library(gmp)

a <- as.bigz(1)
b <- as.bigz(1)
c <- a + b
n <- 2

while(nchar(as.character(c)) < 1000) {
  n <- n + 1
  c <- a + b
  a <- b
  b <- c
}

cat(n)

# More elegantly, we note that Fibonacci sequence converges via Binet's formula
# (https://en.wikipedia.org/wiki/Fibonacci_number#Relation_to_the_golden_ratio)
# specifically phi^n / sqrt(5) where phi ~ 1.6180
# since we want 1000 digits, set (phi^n / sqrt(5)) = 999 and solve

phi <- 1.6180
n <- floor((log(10)*999 + log(5)/2)/log(phi))
cat(n)