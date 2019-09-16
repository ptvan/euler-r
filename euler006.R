# Project Euler problem 006
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

sum(1:100)^2 - sum(unlist(lapply(1:100, function(x)x^2)))