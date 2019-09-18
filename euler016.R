# Project Euler problem 016
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

# here we run into a problem with R's handling of very large numbers,
# although R can handle 2^1000, the default numeric precision is 22 digits
# so we ending up needing the gmp package for increased precision

library(gmp)
tiny <- pow.bigz(2, 1000)
digits <- unlist(strsplit(as.character(tiny), ""))
sum(as.numeric(digits))