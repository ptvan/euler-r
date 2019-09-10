# Project Euler problem 004
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

is_palindrome <- function(string){
  fwd <- unlist(strsplit((as.character(string)), ""))
  bck <- rev(fwd)
  return(all(fwd == bck))
}

largest <- 0

for (i in 100:999) {
  for (j in 100:999){
    if (is_palindrome(i * j) & i*j > largest){
      largest <- i * j
      #  cat(i, "x", j, "=", largest, "\n")
    }    
  }
}