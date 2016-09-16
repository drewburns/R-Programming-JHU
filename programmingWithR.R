if (TRUE==TRUE) {
  print("Andrew")
} else {
  print("Not Andrew")
}

x <- 4
y <- if(x>3) {
  10
} else {
  0
}

print(y)

####################

alpha <- c("a","b","c","d")
for(letter in alpha) {
  print(letter)
}

####################
z <- 0

while(z<10) {
  z <- z+1
  print(z)
}
###################
#First function

add2 <- function(x,y){
  x+y
}

above <- function(x,n) {
  use <- x>n
  x[use]
}

columnmean <- function(y, removeNA = TRUE) {
  numcol <- ncol(y)
  means < numeric(numcol)
  for(i in 1:numcol) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

################################
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
# cube <- make.power(3)
# square <- make.power(2)
# cube(3)
# square(2)

################################

x <- Sys.time()
y <- as.POSIXct(x)

################################################################

#APPLY Functions

x <- list(a= 1:5, b = rnorm(10))
lapply(x,mean)


x <- matrix(rnorm(200),20,10)
apply(x, 2 , mean)

apply(x,1, sum)

mapply(rep, 1:4,4:1)
#instead of typing list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))


x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10) # makes 10 1's, 10 2's, 10 3's
f
x
tapply(x,f,mean)

split(x,f) #splits into the groups

############################
x <- rnorm(100,10,10)
str(x)
#str - very important function
#displays and summarizes the object


#rnorm(number,mean,sd)
#set.seed(1) - reproduce random numbers
#Generating Poisson Data ?Look up later?
rprois(10,1)

###########################

set.seed(20)
x <- rnorm(100) #rbinorm(100,1,0.5) binary distribution
e <- rnorm(100, 0 , 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y)

##########################

sample(letters,5)
sample(1:10,5)
##########################
system.time(readLines("http://www.jhsph.edu"))
summaryRprof()

