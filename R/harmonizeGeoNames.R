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
#' @export


harmonizeGeoNames <- function(cleanSdgs){
  
  #checks
  if(!is.data.frame(cleanSdgs)) stop("must be a dataframe")
  if(!("areacode" %in% colnames(cleanSdgs))) stop("areacode column not found")
  
  #clean codes in cleanSdgs
  cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 1] <- paste0("00", cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 1])
  cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 2] <- paste0("0", cleanSdgs$areacode[str_length(cleanSdgs$areacode) == 2])
  
  #add official m49 name column
  cleanSdgs <- left_join(cleanSdgs, 
                  m49, #internal dataframe
                  by = c("areacode" = "Code"))
  
  #since some areas are combination with no official, take areaname if Name is NA
  cleanSdgs$Name[is.na(cleanSdgs$Name)] <- cleanSdgs$areaname[is.na(cleanSdgs$Name)]
  cleanSdgs <- cleanSdgs %>%
    select(-areaname) %>%
    rename(areaname = Name) %>%
    select(areacode, areaname, everything())
  
  
}