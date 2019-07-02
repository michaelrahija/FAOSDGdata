#test functions

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
          "14.b.1",
          "15.1.1",
          "15.2.1",
          "15.4.2")
          #"15.6.1") #18

y <- getData("2.1.1")



x <- lapply(sdgs, getData)



names(x) <- gsub("\\.", "_",sdgs)
sapply(x,colnames)

sapply(x, head)
