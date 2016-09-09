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

