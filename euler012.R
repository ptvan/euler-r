# Project Euler problem 012
# What is the value of the first triangle number to have over five hundred divisors?

triangle <- function(n) return (sum(1:n))

findFactors <- function(n) {
    factors <- list() 
    for (i in 1:sqrt(n)) {
      if (n %% i == 0) {
        factors[[length(factors) + 1]] <- c(i, n / i)
      }
    }
    return(factors)
}

max_factors <- 0
i <- 1
factors <- c(1)

while (length(factors) < 500){
    num <- triangle(i)
    factors <- unique(unlist(findFactors(num)))
    if (length(factors) > max_factors) {
      max_factors <- length(factors)
      # cat(num, "has", length(factors), ":", factors, "\n\n" )
    }
    i <- i + 1
}

cat(num)