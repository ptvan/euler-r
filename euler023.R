# Project Euler problem 023
# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n 
# and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
# the smallest number that can be written as the sum of two abundant numbers is 24. 

# By mathematical analysis, it can be shown that all integers greater than 28123 
# can be written as the sum of two abundant numbers. 

# However, this upper limit cannot be reduced any further by analysis 
# even though it is known that the greatest number that cannot be expressed 
# as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

library(numbers)
abundant <- c()
limit <- 28123

for (i in 1:limit){
  divs <- divisors(i)[-length(divisors(i))]
  if(sum(divs) > i){
    abundant <- c(abundant, i)
    # cat(i, "is an abundant number with divisors: ", divs, "\n")
  }
}

len <- length(abundant)

sums <- matrix(0, len, len, dimnames = list(abundant, abundant))

for (i in 1:(len - 1)) {
  for (j in i:len) {
    sums[i, j] <- sum(abundant[c(i, j)])
  }
}

sums <- unique(as.vector(sums))
sums <- sums[sums <= limit]

cat(sum(1:limit) - sum(sums))
