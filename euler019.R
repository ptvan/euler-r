# Project Euler problem 019
# You are given the following information, but you may prefer to do some research for yourself.
# 
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# 
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
  
# using libraries, nott terribly faster, but a bit cleaner and less error-prone

library(lubridate)
startDate <- dmy("1-Jan-1901")
endDate <- dmy("31-Dec-2000")
allDays <- seq(from = startDate, to = endDate, by = "days")
sundays <- allDays[which(wday(allDays)==1)]
length(sundays[day(sundays) == 1])