# Project Euler problem 010
# Find the sum of all the primes below two million.

# This is a bigger version of euler007, 
# so we use a more R-ish solution which is a lot faster

primes <- function(n){
  vec <- 2:n
  i <- 1
  while (vec[i] <= sqrt(n)){
    vec <-  vec[vec %% vec[i] != 0 | vec == vec[i]]
    i <- i+1
  }
  return(vec)
}

cat(sum(primes(2e6)))