#' cleanData
#' 
#' This is function which takes as an input a dataframe containing data
#' for a particular indicator, and outputs a dataframe simplied column names, and 
#' all columns in the class character.
#'
#' @param sdgdf is a data frame referring to a specific SDG
#'
#' @return This function returns a dataframe containing the cleaned data frame
#'
#' @importFrom dplyr select
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
  
df  
  
}