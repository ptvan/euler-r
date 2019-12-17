# Project Euler problem 026 :
# A unit fraction contains 1 in the numerator. 
# The decimal representation of the unit fractions with denominators 2 to 10 are given:
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1 

# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
# It can be seen that 1/7 has a 6-digit recurring cycle.
 
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle 
# in its decimal fraction part.

# for each number, calculate the remainders of the division
# if remainder repeats that means we've ended the recurring cycle
# since R doesn't have a do-while, we use repeat and break
# note: we're generating this sequence: https://oeis.org/A051626

recurring_length <- function (n, x = 1) {
  remainders = c(x)
  repeat {
    x <-  (x * 10) %% n                  
    if (x == 0) { return (0) }        
    if ((x %in% remainders)) 
      { break }  
    remainders <- c(remainders, x)    
  }
  return (length(remainders) - which(remainders == x) + 1)  
}

lengths <- unlist(lapply(1:1000, recurring_length))
 
which(lengths == max(lengths))