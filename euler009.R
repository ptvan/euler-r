# Project Euler problem 009
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# Here we exploit the fact that a < b < c
# which in turn means a < (a + b + c) / 3
# and a < b < (a + b + c) / 2

a <- 0
b <- 0
c <- 0
s <- 1000

found <- FALSE

for (a in 1:floor(s/3)){
  for (b in a:floor(s/2)){
    c = s - (a + b)
    if (a^2 + b^2 == c^2){
      found <- TRUE
      break
    }
  }
  if (found == TRUE) break
}

cat(a, "x", b, "x", c, "=", a*b*c)