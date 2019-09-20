# Project Euler problem 021
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

# we use numbers::divisors(), which includes the number itself, so need to remove it
# to get proper divisors
# we also exclude numbers that are amicable to themselves
# we start from the first known amicable number, 220 

library(numbers)
amicables <- vector()

for (i in 220:9999){
  s <- divisors(i)
  j <- sum(s[-length(s)])
  t <- divisors(j)
  
  if (sum(t[-length(t)]) == i && i!=j) {
    amicables <- c(amicables, i, j)
  }
}

cat(sum(unique(amicables)))
