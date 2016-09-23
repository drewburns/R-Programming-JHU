best <- function(state,outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  stateFiltered <- subset(data, data[,7] == state)
  possibleOutcomes <- c("heart attack", "heart failure", "pneumonia", 
                        "readmission attack", "readmission failure", "readmission pneumonia")
  possibleOutcomeRows <- c(11,17,23,29,35,41)

  if ((nrow(stateFiltered) == 0) && (outcome %in% possibleOutcomes == FALSE)) {
    print("This is invalid")
    break
  } else {
    use <- possibleOutcomes == outcome
    column <- possibleOutcomeRows[match(TRUE,use)]
    
    finalState <- stateFiltered[,column]
    finalValues <- lapply(finalState, function(x) as.numeric(x))
    best <- stateFiltered[which.min(finalValues),]
    print(best[,2])
    
  }
}

rankHospital <- function(state,outcome, num="best") {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  stateFiltered <- subset(data, data[,7] == state)
  possibleOutcomes <- c("heart attack", "heart failure", "pneumonia", 
                        "readmission attack", "readmission failure", "readmission pneumonia")
  possibleOutcomeRows <- c(11,17,23,29,35,41)
  
  if ((nrow(stateFiltered) == 0) && (outcome %in% possibleOutcomes == FALSE)) {
    break
  } 
  
  use <- possibleOutcomes == outcome
  column <- possibleOutcomeRows[match(TRUE,use)]
  
  finalState <- stateFiltered[,column]
  finalValues <- lapply(finalState, function(x) as.numeric(x))

  if (num=="best") {
    selectedHospital <- stateFiltered[which.min(finalValues),]
  } else if (num == "worst") {
    selectedHospital <- stateFiltered[which.max(finalValues),]
  } else {
    num <- as.numeric(num)
    x <- unlist(finalValues)
    n <- length(unique(x))
    selectedHospital <- stateFiltered[which(x == sort(unique(x),partial=n-num)[n-num]),]
  }
  print(paste("The", num , "ranked hospital(s) are", selectedHospital[,2]))
  
  selectedHospital
}

rankall <- function(outcome, num) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  possibleOutcomes <- c("heart attack", "heart failure", "pneumonia", 
                        "readmission attack", "readmission failure", "readmission pneumonia")
  possibleOutcomeRows <- c(11,17,23,29,35,41)
  
  states <- sort(unique(data[,7]))
  hospitals <- c()
  
  for (state in states) {
    print(state)
    hospitals <- append(hospitals, rankHospital(state,outcome,num)[,2])
    #get n best in that state
    # make matrix with [state,hosptial]
  }
  m <- cbind(states , hospitals)
  m
}

# rankall("heart attack", "best")
# rankHospital("NY","heart attack", "3")
# best("CT","readmission attack")

#heart attack
#heart failure
#pneumonia
#readmission attack
#readmission failure
#readmission pneumonia