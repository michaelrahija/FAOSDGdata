#' adopt_m49_for_FAO
#' 
#' This is function which takes as an input a dataframe containing the raw M49 
#' classification scraped from UNSD, and outputs a dataframe with renamed columns for 
#' consistency with SDG as well as modifications used by FAO.
#'
#' @param raw_m49 is the dataframe returned by scrape_m49.R
#'
#' @return Dataframe containing m49 classifications with same column names as 
#' the SDG data files, and modifications for FAO.
#'
#' @export

adopt_m49_for_FAO <- function(raw_m49){
  
  #check input
  if (colnames(raw_m49)[1] != "Global Code" ||
      colnames(raw_m49)[15] != "Developed / Developing Countries") {
    stop("Input does not appear to be raw M49 dataframe. Please check.")
  }
  
  #harmonize call names with SDG data teample
  colnames(raw_m49) <- c(
    "globalcode",
    "globalname",
    "regioncode",
    "regionname",
    'subregioncode',
    "subregionname",
    "intermediateregioncode",
    'intermediateregionname',
    'areaname',
    "areacode",
    "iso3",
    "ldc",
    "lldc",
    "sids",
    "develop"
  )
  
  #custom FAO classifications
  taiwan <- data.frame(areacode = "158",
                       areaname = "Taiwan, Province of China",
                       footnote  = "FAO code and descriptor; descriptor as in NOCS")
  tanzania <- data.frame(areacode = "836",
                         areaname = "United Republic of Tanzania, Zanzibar",
                         footnote  = "FAO code and descriptor; agreed with FAOTERM")
  kosovo <- data.frame(areacode = "412",
                         areaname = "Kosovo (Serbia)",
                         footnote  = "FAO code and descriptor; agreed with FAOTERM")
  
  palestine <- data.frame(areacode = "275",
                          areaname = "Palestine",
                          footnote  = "FAO descriptor as in NOCS")
  

  
  
  
}