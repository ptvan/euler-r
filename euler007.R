# Project Euler problem 007
# What is the 10 001st prime number?

# first using libraries, because modern computers are fast
library(numbers)
i <- 2
primes <- NULL

while( length(primes) < 10001){
  if (isPrime(i)) {
    primes[length(primes)+1] <- i
  }
  i <- i + 1
}

cat(primes[10001], "\n")

# then, from first principles, we implement a naive sieve of Erastosthenes
sieve <- function(n){
    vec <- rep(TRUE, n-1)
    names(vec) <- 2:n
    ceil <- ceiling(sqrt(n))
    # cat(ceil, "\n")
    for (i in 2:ceil){
      vec[which(as.numeric(names(vec)) %% i == 0)[-1]] = FALSE      
    }
    return(as.numeric(names(vec[vec==TRUE])))
}

primes <- sieve(1.5e5)
cat(primes[10001])

