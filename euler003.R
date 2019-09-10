# Project Euler problem 003
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

num <- 600851475143

# using libraries, which is why we're using R in the first place, no ?
library(numbers)
max(primeFactors(num))

# this is actual work: get the list of primes, then factor them out from
# the given number
primes <- Primes(2, ceiling(sqrt(num)))

vec <- c()
for (i in 1:length(primes)){
  if (num %% i == 0 & i > 1){
    if (prod(c(vec,i)) <= num){
      vec <- c(vec, i)
    }
  }
}

max(vec)
