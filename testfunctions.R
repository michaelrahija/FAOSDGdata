#test functions
library(dplyr)

source("R/getData.R")

sdgs <- c("2.1.1",
          "2.1.2",
          "2.3.1",
          "2.3.2",
          "2.5.1_Plants",
          "2.5.1_Animals",
          "2.5.2",
          "2.a.1",
          "2.c.1",
          "6.4.1",
          "6.4.2",
          "14.4.1",
          "14.6.1",
          "14.7.1",
          "14.b.1",
          "15.1.1",
          "15.2.1",
          "15.4.2")
          #"15.6.1") #18


raw.data <- lapply(sdgs, function(x) getData(x, source = "web"))
clean <- lapply(raw.data, cleanData)
clean.df <- do.call("rbind", clean)


#look at vars, remove value to skip tabulation
test <- select(clean.df,-value)
t <- sapply(test, table)

#harmonize column names
names(y) <- lapply(y, function(x) unique(x$Indicator))

y <- lapply(y, cleanData)


df <- do.call("bind_rows",y)



cols <- colnames(y$'2.1.1')

y <- lapply(y, select(cols))

#need to edit 2.5.1 name, a = plants, b = animals
temp <- x[names(x) == '2.5.1']

animals <- sapply(temp, function(x) grep("Plant",x$SeriesDescription))



lapply(x, function(x) unique(x$SeriesDescription))

#datasets for `15.2.1`, `2.5.2`


lapply(x, colnames)

#2.5.1 Indicator Reference Number should be renamed to "Indicator"
#6.4.1 file contains indicator values that are not only 6.4.1

names <- lapply(x, colnames)

indicator.test <- list()
for(i in 1:length(y)){
  
  y[[i]]$indicator
  
}



