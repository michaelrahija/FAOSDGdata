#' harmonizeCols
#' 
#' This is function which takes as an input a dataframe containing data
#' for a particular indicator, and outputs a dataframe with SDMX concepts as column names and
#' followed by an attribute name. Example: REF_REA
#'
#' @param sdgdf is a data frame referring to a specific SDG
#'
#' @return This function returns a dataframe containing the cleaned data frame
#'
#' @importFrom dplyr select
#' @export

harmonizeCols <- function(sdgdf){
  
  #filter SDG 2.1.2 for mid bounds
  if("2.1.2" %in% unique(sdgdf$Indicator)){
    sdgdf <- filter(sdgdf, Bounds == "Mid-point")
  }
  
  
  #get rid of any spaces in a column name
  colnames(sdgdf) <- gsub(pattern = " ",
                          replacement = "", 
                          colnames(sdgdf))
  
  #harmonize footnote column name
  colnames(sdgdf)[grepl("foot", colnames(sdgdf), ignore.case = T)] <- "Footnote"
  
  if(!("Age.Group" %in% colnames(sdgdf))) {
    sdgdf$Age.Group <- NA
  }
  
  
  if(!("Disaggregation" %in% colnames(sdgdf))) {
    sdgdf$Disaggregation <- NA
  }
  
  if(!("Time_Detail" %in% colnames(sdgdf))) {
    sdgdf$Time_Detail <- NA
  }
  
  if(!("ReportingType" %in% colnames(sdgdf))) {
    sdgdf$ReportingType <- NA
  }
  
  if(!("Bounds" %in% colnames(sdgdf))) {
    sdgdf$Bounds <- NA
  }
  
  
  #select relevant columns, and provide simple names
  relcols <- c("GeoAreaCode",
               "GeoAreaName",
               "RefAreaType_InternalUseOnly",
               "SeriesCode",
               "SeriesDescription",
               "Indicator",
               "TimePeriod",
               "Time_Detail",
               "Nature",
               "Units",
               "ReportingType",
               "Source",
               "Value",
               "Age.Group",
               "Bounds",
               "Disaggregation",
               "Footnote",
               "version")
  
  df <- select(sdgdf, relcols)
  
  #recode w/ SDMX concept names when possible, when concept
  colnames(df) <- c("REF_AREACode",
                    "REF_AREADesc",
                    "RefAreaType_InternalUseOnly",
                    "SERIESCode",
                    "SERIESDescription",
                    "SERIESInd",
                    "TIME_PERIOD",
                    "TIME_DETAIL",
                    "NATURE",
                    "UNIT_MEASURE",
                    "REPORTING_TYPE",
                    "SOURCE_DETAIL",
                    "OBS_VALUE",
                    "AGE",
                    "Bounds",
                    "Disaggregation",
                    "Footnote",
                    "version")
  
  #clean classes
  df[] <- lapply(df, as.character)
  
df  
  
}