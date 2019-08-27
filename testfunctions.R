#test functions
library(dplyr)

#--GET ALL DATASETS, CLEAN-UP COLUMN NAMES, AND MERGE
allSdgs <- getDatasets(all = T)

#keep only relevant columns, harmonize names, to merge into 1 df
cleadSdgs <- lapply(allSdgs, cleanData)
Sdgsdf<- do.call("rbind", cleadSdgs)



##--GET M49, adopt for FAO, and flatten
geo <- scrape_m49() %>%
          adopt_m49_for_FAO()

flatm49 <- flatten_m49(geo)

#filter sdg dataset for only areas with valid m49 codes
sdgs_validcodes <- filter(Sdgsdf, areacode %in% flatm49$code)
sdgs_INvalidcodes <-  filter(Sdgsdf, !(areacode %in% flatm49$code))
table(sdgs_INvalidcodes$areaname)

#merge sdg dataset with m49 to create consistent area names
flatm49 <- select(flatm49, -level)

x <- merge(sdgs_validcodes,
           flatm49,
           by.x = "areacode",
           by.y = "code",
           all.x = T)

nrow(x) == nrow(ma_valid)

x$areaname <- x$name

sdgs_validnames <- select(x, -name)





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

#geo names
rawSdgs <- getDatasets(all = T)
allSdgs <- rawSdgs
cleanall <- lapply(allSdgs, cleanData)
sdgsdf <- do.call("rbind", cleanall)

cleanSdgs <- sdgsdf


unique(sdgsdf$areatype)
regions <- filter(sdgsdf, grepl("Region", areatype))
reg_sm <- regions %>%
            group_by(areaname, indicator) %>%
            summarize(n = n())

##need to clean country, and geo area names. 
##
##need to create df with country, value, indicator, for the latest year

x <- cleanSdgs
geo <- x %>% 
        group_by(areaname, areacode) %>% 
        summarize(n = n()) %>%
        arrange(areaname) %>%
        as.data.frame()


