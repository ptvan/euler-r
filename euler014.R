# Project Euler problem 014
# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
#   13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?


collatz <- function(n){
  seq <- n
  while (n != 1) {
    if (n %% 2 == 0)
      n <- n / 2
    else
      n <- 3 * n + 1
    seq <- c(seq, n)  
  }
  return(seq)
}

# naive implementation, ~2 mins
longest <- c(1,2,4)
for (i in 1:1e6){
  # cat(i, "\n")
  chain <- collatz(i)
  if (length(chain) > length(longest)){
    longest <- chain
  }
}
cat(longest, "\n")

# dynamic programming / memoization version
collatz_fast <- function(n){
  seq <- c()
  seq <- c(seq, n)
  tmp <- n
  has2 <- list()
  
  while (tmp > 1) {
    if (tmp %% 2 == 0) {
      tmp <- tmp / 2
      if (tmp %in% has2){
        seq <- c(seq, has2$tmp)
        break
        } else {
          seq <- c(seq, tmp)}
    } else {
        tmp = 3 * tmp + 1
        if (tmp %in% has2){
          seq <- c(seq, has2$tmp)
          break
          } else {
            seq <- c(seq, tmp)
          }
      }
    
  }
  has2$n <- seq
  return(length(seq))
}

num <- 0
biggest <- 0
for (i in 1:1000000){
  c <- collatz_fast(i)
  if (num < c){
    num <- c
  }
  biggest <- i
}
cat(biggest, "has", num, "elements")
