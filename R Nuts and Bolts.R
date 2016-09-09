x <- 2
x
print(x+x) ## both of these work
newVar <- 1:20
newVar
#########################
newArray <- c(1,2,4,6)
anotherArray <- c(TRUE, FALSE, TRUE)
thirdArray <- vector("complex", length=10)
mixedArray <- c("a" , 1.6)
mixedArray #turns the 1.6 into a string
newList <- list("Andrew", TRUE, 0+3i, 44)
#########################
newMatrix <- matrix(1:6, nrow=2, ncol=3)
newMatrix
xval <- 1:3
yval <- 10:12
cbind(xval, yval)
rbind(xval, yval)
#########################
factorTest <- factor(c("yes", "no", "no", "yes"), levels=c("yes","no"))
factorTest
#########################
newDataFrame <- data.frame(foo=1:4, bar = c("true","false","true","true"))
newDataFrame
#########################
namedVector <- c(1,2,3)
names(namedVector) <- c("a","b","c")
namedVector
#########################
testFrame <- data.frame(a=1, b="a")
dput(testFrame)
#Dump is similar but can use multiple objects?
