# Project Euler problem 005
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# again, first we cheat a bit by using libraries
library(numbers)
mLCM(1:20)

# a bit more work, get prime factors, then multiply them out
lst <- lapply(1:20,primeFactors)
factors <- unique(unlist(lst))

lcm <- 1

for (i in 1:length(factors)){
  count <- max(unlist(lapply(lapply(lapply(lst, function(x)return(x==factors[i])), which), length) ))
  cat(factors[i], " x ", count, "\n")
  lcm <- lcm * factors[i] ^ count
}