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
  
  raw_m49$footnote = "unaltered M49"
  
 
  #custom FAO classifications
  taiwan <- data.frame(
    globalcode = "1",
    globalname = "World",
    regioncode = "142",
    regionname = "Asia",
    subregioncode = "30",
    subregionname = "Eastern Asia",
    intermediateregioncode = NA,
    intermediateregionname = NA,
    areacode = "158",
    areaname = "Taiwan, Province of China",
    iso3 = "",
    ldc = NA,
    lldc = NA,
    sids = NA,
    develop = NA,
    footnote  = "FAO code and descriptor; descriptor as in NOCS"
  )
  
  tanzania <- data.frame(
    globalcode = "1",
    globalname = "World",
    regioncode = "2",
    regionname = "Africa",
    subregioncode = "201",
    subregionname = "Sub-Saharan Africa",
    intermediateregioncode = "14",
    intermediateregionname = "Eastern Africa",
    areacode = "836",
    areaname = "United Republic of Tanzania, Zanzibar",
    iso3 = "",
    ldc = NA,
    lldc = NA,
    sids = NA,
    develop = NA,
    footnote  = "FAO code and descriptor; agreed with FAOTERM"
  )
  kosovo <- data.frame(
    globalcode = "1",
    globalname = "World",
    regioncode = "150",
    regionname = "Europe",
    subregioncode = "39",
    subregionname = "Southern Europe",
    intermediateregioncode = NA,
    intermediateregionname = NA,
    areacode = "412",
    areaname = "Kosovo (Serbia)",
    iso3 = "",
    ldc = NA,
    lldc = NA,
    sids = NA,
    develop = NA,
    footnote  = "FAO code and descriptor; agreed with FAOTERM"
  )
  
  palestine <- data.frame(
    globalcode = "1",
    globalname = "World",
    regioncode = "142",
    regionname = "Asia",
    subregioncode = "145",
    subregionname = "Western Asia",
    intermediateregioncode = "",
    intermediateregionname = "",
    areacode = "275",
    areaname = "Palestine",
    iso3 = "",
    ldc = NA,
    lldc = NA,
    sids = NA,
    develop = NA,
    footnote  = "FAO descriptor as in NOCS. Code same as M49, but name changed."
  )
  
  raw_m49 <- raw_m49[raw_m49$areaname != "State of Palestine",]
  
  
  m49 <- rbind(raw_m49,
               taiwan,
               tanzania,
               kosovo,
               palestine)
  
  
m49  
}