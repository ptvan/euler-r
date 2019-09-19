# Project Euler problem 017
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used? 

# this is straightforward logic switching, likely could be made more terse 
# but I find the version below easy to read

singles <- c("one"
             ,"two"
             ,"three"
             ,"four"
             ,"five"
             ,"six"
             ,"seven"
             ,"eight"
             ,"nine"
             ,"ten")
             
teens <- c("eleven"
             ,"twelve"
             ,"thirteen"
             ,"fourteen"
             ,"fifteen"
             ,"sixteen"
             ,"seventeen"
             ,"eighteen"
             ,"nineteen")

tens <- c(""
            ,"twenty"
            ,"thirty"
            ,"forty"
            ,"fifty"
            ,"sixty"
            ,"seventy"
            ,"eighty"
            ,"ninety")

length <- 0 
str <- ""

for (i in 1:1000){
  # cat(i, "")
  if (i < 11) {
    str <- singles[i]
  }
  
  if (i >= 11 && i < 20) {
    str <- teens[i-10]
  }
  
  if (i >= 20 && i < 100){
    digits <- as.numeric(unlist(strsplit(as.character(i), "")))
    str <- paste(tens[digits[1]], singles[digits[2]], sep=" ")
  }
  
  if (i >= 100 && i < 1000){
    digits <- as.numeric(unlist(strsplit(as.character(i), "")))
    if (digits[2] == 0) {
      str <- paste(singles[digits[1]],"hundred", singles[digits[3]], sep=" ")
    }
    
    if (digits[2] == 1) {
        str <- paste(singles[digits[1]],"hundred", teens[digits[2]], singles[digits[3]], sep=" ")
    }
      
    if (digits[2] >=2)  
        str <- paste(singles[digits[1]],"hundred", tens[digits[2]], singles[digits[3]], sep=" ")
    }

  if (i == 1000){
    str <- "one thousand"
  }
  # cat(str, "\n")
  length <- length + nchar(str)
}

cat(length)