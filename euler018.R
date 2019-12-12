# Project Euler problem 018
# Find the maximum total from top to bottom of the triangle below:

# 75
# 95 64
# 17 47 82
# 18 35 87 10
# 20 04 82 47 65
# 19 01 23 75 03 34
# 88 02 77 73 07 63 67
# 99 65 04 28 06 16 70 92
# 41 41 26 56 83 40 80 70 33
# 41 48 72 33 47 32 37 16 94 29
# 53 71 44 65 25 43 91 52 97 51 14
# 70 11 33 28 77 73 17 78 39 68 17 57
# 91 71 52 38 17 14 91 43 58 50 27 29 48
# 63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

# to make the solution scaleable, I've used a sparse matrix

width <- 16
height <- 16
  
raw <- list()

raw[[1]] <- c("75", rep(0, width-1))
raw[[2]] <- c(unlist(strsplit("95 64", " ")), rep(0,width-2))
raw[[3]] <- c(unlist(strsplit("17 47 82", " ")), rep(0,width-3))
raw[[4]] <- c(unlist(strsplit("18 35 87 10", " ")), rep(0,width-4))
raw[[5]] <- c(unlist(strsplit("20 04 82 47 65", " ")), rep(0,width-5))
raw[[6]] <- c(unlist(strsplit("19 01 23 75 03 34", " ")), rep(0,width-6))
raw[[7]] <- c(unlist(strsplit("88 02 77 73 07 63 67", " ")), rep(0,width-7))
raw[[8]] <- c(unlist(strsplit("99 65 04 28 06 16 70 92", " ")), rep(0,width-8))
raw[[9]] <- c(unlist(strsplit("41 41 26 56 83 40 80 70 33", " ")), rep(0,width-9))
raw[[10]] <- c(unlist(strsplit("41 48 72 33 47 32 37 16 94 29", " ")), rep(0,width-10))
raw[[11]] <- c(unlist(strsplit("53 71 44 65 25 43 91 52 97 51 14", " ")), rep(0,width-11))
raw[[12]] <- c(unlist(strsplit("70 11 33 28 77 73 17 78 39 68 17 57", " ")), rep(0,width-12))
raw[[13]] <- c(unlist(strsplit("91 71 52 38 17 14 91 43 58 50 27 29 48", " ")), rep(0,width-13))
raw[[14]] <- c(unlist(strsplit("63 66 04 68 89 53 67 30 73 16 69 87 40 31", " ")), rep(0,width-14))
raw[[15]] <- c(unlist(strsplit("04 62 98 27 23 09 70 98 73 93 38 53 60 04 23", " ")), rep(0,width-15))

m <- Matrix(do.call(rbind, raw), sparse=TRUE)

total <- 0
curCol <- 1
curVal <- m[1,1]
i <- 1

# there is a subtle bug here when encountering multiple same values on the same row
# the code below would compute values on all paths below that row
# I've worked around this by using max(), but should be addressed for a cleaner solution

while (i < nrow(m)){
  # cat("row", i, "current =", m[i, curCol])
  nextCols <- c(ifelse(curCol<=0,1 ,curCol),curCol+1)
  nextVals <- c(m[i+1, nextCols] )
  curCol <- which(m[i+1,]==max(nextVals))
  total <- total + m[i, curCol]
  # cat(" next row's indices:", nextCols, "with values ", nextVals, ", max is", max(nextVals), " at", which(m[i+1,]==max(nextVals)), "total is", total, "\n")
  i <- i+1
}  

cat(max(total))