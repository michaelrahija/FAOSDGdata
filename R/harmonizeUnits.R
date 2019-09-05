#' harmonizeUnits
#' 
#' This is function which takes as an a column of dataframe (as a vector) which contains units of measure
#' and returns a vector of the same length using consistent units of measure.
#'
#' @param unitcolumn a vector of type character containing inconsistent units of measure
#'
#' @return This function returns a character vector containing the consistent units of measure
#'
#' @export

harmonizeUnits <- function(unitcolumn){
  
  #checks
  if(!is.vector(unitcolumn)) stop("must be a vector")
  
  #replace all values containing "%" or "percent" with "%"
  unitcolumn[grepl("%", unitcolumn ) | grepl("percent", unitcolumn , ignore.case = T)] <- "%"
  
  #replace all values containing "Index"  with "index"
  unitcolumn[grepl("index", unitcolumn , ignore.case = T)] <- "index"
  
  #format ppps values for 2.3.1 and 2.3.2
  unitcolumn <- gsub("Agricultural output per labour day, ","", unitcolumn)
  unitcolumn <- gsub("Average annual income from agriculture, ","", unitcolumn)
  unitcolumn <- gsub("\n","", unitcolumn)
  
  #format values for 14.6.1 and 14.b.1
  unitcolumn[grepl("Level of implementation", unitcolumn , ignore.case = T)] <- "Level of implementation: 1 lowest to 5 highest"
  
  #format values for 15.2.1
  unitcolumn[unitcolumn == "T_PER_HA"] <- "Tons per hectare"
  unitcolumn[unitcolumn == "HA_TH"] <- "Thousands of hectares"
  
  #format for 2.5.1
  unitcolumn[unitcolumn == "NUMBER"] <- "Number"
  
unitcolumn

  }