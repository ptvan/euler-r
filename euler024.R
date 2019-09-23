# Project Euler problem 024
# A permutation is an ordered arrangement of objects. 
# For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. 
# If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. 
# The lexicographic permutations of 0, 1 and 2 are: 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

# using libraries the brute force method is trivial but extremely naive
library(gtools)
digits <- 0:9
p <- permutations(10,10, digits)
cat(p[1e6,])

# but we also notice that 10! = 3628800 and 9! = 362880
# which means the first 362880 entries start with 0, 
# and the next 362880 entries start with 1, etc...
# since the permutations are sorted, we can figure out the sequence one digit at a time
# instead of explicitly calculating out all the permutations

lex <- function(seq, n){
  len <- length(seq)
  vec <- numeric(len)
  for (i in 1:(len-1)){
    if (n == 0) {
      vec[i] <- seq[length(seq)]
    } else {
      tmp <- prod(1:(len-i))
      div <- floor((n - 1) / tmp)
      vec[i] <- seq[div + 1]
      n <- n %% tmp
      seq <- seq[seq != vec[i]]
    }
    # cat("tmp =", tmp, "n =", n, "div =", div, "vec:", vec, "\n")
  }
  return(vec)
}

cat(lex(0:9, 1e6) )
