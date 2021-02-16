##########################################################
# ECON 346, NEIU
# Lab Exercise #1 -- A Really Basic Intro 
##########################################################

#Three ways to create an object
#There are simply single values

v1<-2
v2=9
4->v3

#Generally the top one is preferred
#Storing objects for future use

#Try some orders of operation
v2-v1
v3/v2
v3/v2-v1
#Question: What formula could you use to turn v1, v2, and v3 into 14?

#"telescoping" some operations
#Multiply, round to two decimal places
#Parentheses are very important--make sure they match

v3/v2-v1
v1*(v3/v2-v1)
round(v1*(v3/v2-v1),2)

#Try it a different way
v4<-v1*(v3/v2-v1)
round(v4,2)
#QUESTION: How could you round v4 to three decimal places?

#Now make a matrix; start with a list
#This just fills in the numbers in order
m1<-c(1:12)
m1
#notice [#rows, #columns]

#Note the "as.***" family--this converts
m2<-as.matrix(x=m1)
m2
#Change dimension
dim(m2)<-c(4,3)
m2
#Question: How would you make a 2 x 6 matrix, and how many rows would it have?

#Extract a vector: here -- the middle column
#Notice the brackets!
m2[,2]
#Extract the bottom left corner
m2[4,3]
#transpose the matrix
t(m2)
#double every value in m2
2*m2

#copy m2 (just in case) and change the lower right to 999)
m3<-m2
m3[4,3]<-999
m3
#QUESTION: How could you change the value 6 in m2 to 22?



