#' harmonizeGeoNames
#' 
#' This is function which takes as an input a dataframe containing data
#' cleanData, and applies the M49 
#'
#' @param cleanSdgs is a data frame referring one or more SDGs
#'
#' @return This function returns a dataframe containing the cleaned data frame
#'
#' @importFrom dplyr left_join
#' @importFrom tidyselect everything
#' @importFrom stringr str_length
#' @export


harmonizeGeoNames <- function(cleanSdgs){
  
  #checks
  if(!is.data.frame(cleanSdgs)) stop("must be a dataframe")
  if(!("areacode" %in% colnames(cleanSdgs))) stop("areacode column not found")
  
  #add 0s to codes for sdg dataset
  cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 1] <- paste0("00", cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 1])
  cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 2] <- paste0("0", cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 2])
  
  #add official m49 name column
  # cleanSdgs <- left_join(cleanSdgs, 
  #                           m49, #internal dataframe
  #                           by = c("areacode" = "Code"))
  
  cleanSdgs_m <- merge(cleanSdgs,
                     m49,
                     by.x = "areacode",
                     by.y = "Code",
                     all = T)
  
  #remove rows with NA areanames, result of merger w/ M49. Some M49 names, didn't have codes
  cleanSdgs_m <- cleanSdgs_m[!is.na(cleanSdgs_m$areaname),]
  
  #some m49 areas are combined, and sometimes it says "(M49)" sometimes, not
  test <- filter(cleanSdgs_m, is.na(Name))
  test %>% group_by(areacode, areaname) %>% summarize(n = n())
  
  test2 <- gsub(pattern = " (M49) ",
                "",
                test)
  
  #since some areas are combination with no official, take areaname if Name is NA
  cleanSdgs_m$Name[is.na(cleanSdgs_m$Name)] <- cleanSdgs_m$areaname[is.na(cleanSdgs_m$Name)]
  cleanSdgs_m <- cleanSdgs_m %>%
    select(-areaname) %>%
    rename(areaname = Name) %>%
    select(areacode, areaname, everything())
  
  
}