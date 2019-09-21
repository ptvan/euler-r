# Project Euler problem 022
# given a 46K text file containing over five-thousand first names, 
# begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, 
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
# So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?

# even using base R, this is fairly straightforward

raw <- read.csv("euler022_names.txt")
names <- sort(colnames(raw))

s <- "ABCDEFGHIJKLMNOPQRSTUVXYZ"
total <- 0

for (i in 1:length(names)){
  # cat(names[i], "\n")
  score <- i * sum(unlist(lapply(unlist(strsplit(names[i], "")), function(x) regexpr(x, s)[1])))
  total <- total + score
}

cat(total)