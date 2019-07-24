#' cleanData
#' 
#' This is function which takes as an input a dataframe containing data
#' for a particular indicator, and outputs a dataframe with simplied column names, c
#' consistent classes, and proper M49 geo names.
#'
#' @param sdgdf is a data frame referring to a specific SDG
#'
#' @return This function returns a dataframe containing the cleaned data frame
#'
#' @importFrom dplyr select rename left_join
#' @importFrom stringr str_length
#' @importFrom tidyselect everything
#' @export

cleanData <- function(sdgdf){
  
  #select relevant columns, and provide simple names
  relcols <- c("GeoAreaCode",
               "GeoAreaName",
               "RefAreaType_InternalUseOnly",
               "Indicator",
               "SeriesDescription",
               "TimePeriod",
               "Value",
               "Units",
               "version")
  
  df <- select(sdgdf, relcols)
 
  colnames(df) <- c("areacode",
                    "areaname",
                    "areatype",
                    "indicator",
                    'indicatorDescription',
                    "timeperiod",
                    "value",
                    'unit',
                    'version')
  
  #clean classes
  df[] <- lapply(df, as.character)
  
  #clean codes in df
  df$areacode[str_length(df$areacode) == 1] <- paste0("00", df$areacode[str_length(df$areacode) == 1])
  df$areacode[str_length(df$areacode) == 2] <- paste0("0", df$areacode[str_length(df$areacode) == 2])
  
  #add official m49 name column
  df <- left_join(df, 
                m49, #internal dataframe
                by = c("areacode" = "Code"))
  
  #since some areas are combination with no official, take areaname if Name is NA
  df$Name[is.na(df$Name)] <- df$areaname[is.na(df$Name)]
  df <- df %>%
          select(-areaname) %>%
          rename(areaname = Name) %>%
          select(areacode, areaname, everything())
  
df  
  
}