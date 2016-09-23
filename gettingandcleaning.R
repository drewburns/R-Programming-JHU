ucscDb <- dbConnect(MySQL(), user="genome", host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb)
dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
affyData <- dbReadTable(hg19, "affyU133Plus2")
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMisSmall <- fetch(query, n=10); dbClearResult(query);
dbDisconnect(hg19)

###################
#HDF5 - go back and watch


###################

con = url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlcode = readlines(con)
close(con)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)
library(httr); html2 = GET(url)
content2 = content(html2, as="text")
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

pg = GET("https://httpbin.org/basic-auth/user/passwd", authenticate("user","passwd"))

##############
#using APIs, this wont work because I don't feel like signing up for a twitter API key
myapp = oauth_app("appname", key, secret)
sig = sign_oauth1.0(myapp, token, token_secret)
homeTL = GET("twitter timeline", sig)



############## 
#Reshaping Data

library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt,n=3)
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray,sum)

spIns = split(InsectSprays$count, InsectSprays$spray)
spIns
sprCount = sapply(spIns, sum) #lapply gives list
sprCount

ddply(InsectSprays, .(spray), summarize,sum=sum(count))

# %>% is the pipeline operator


###############
# merging data

if(!file.exists("./data")) {dir.create("./data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv", method="curl")
download.file(fileUrl2, destfile = "./data/solutions.csv", method="curl")
reviews = read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")

mergedData = merge(reviews, solutions,by.x="solution_id", by.y="id", all=TRUE)
head(mergedData)

df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
df3 = data.frame(id=sample(1:10), z=rnorm(10))
dfList = list(df1,df2,df3)
join_all(dfList)