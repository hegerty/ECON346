#########################################################
# ECON346 Lab/Assignment 3: Real GDP growth Rates
#########################################################

#Take real growth rate for four countries: Canada, Japan, UK, US
#Calculate basic summary statistics
#Min, Max, Median
#also introducing apply() and which()

#In class: Load .csv from your own drive (You need to change the I:)
#setwd("I:/)
#data<-read.csv("ECON346_GrowthRates.csv",header=TRUE)

#Load data from my website: Source: IFS + Calculations
data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/ECON346_GrowthRates.csv",header=TRUE)
head(data)

#Do minimum values, column by column
#Notation for minimum, columns
min(data[,2])
min(data[,3])

#Try the "apply" function: Applies to a dataset, row/column (1/2), function
apply(data, 2, min)

#Can re-do for median: One-by-one, or apply()
median(data[,2])
apply(data, 2, median)

#QUESTION: What are the maximum values? Which country has the highest median growth rate?

#Now use which() to identify minimum values for Japan
#Here I mix notation
which(data[,3]==min(data$JPRY))
#This is the observation number
#show column 1 at observation 40
data[40,1]
#Question: What year was the U.S.'s lowest growth rate?

