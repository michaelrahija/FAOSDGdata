#' getData
#' 
#' 
#' This is function which takes as an input an SDG indicator, and returns
#' the latest dataset for that indicator as a dataframe. Pay attention to the naming of the
#' SDG indicators in the default settings. 
#'
#' @param sdg is a specific SDG indicator under FAO custodianship
#'
#' @return This function returns a tibble containing the latest published data
#'
#' @importFrom readxl read_xls
#' @export


getData <- function(sdg = c("2.1.1",
                            "2.1.2",
                            "2.3.1",
                            "2.3.2",
                            "2.5.1_Plants",
                            "2.5.1_Animals",
                            "2.5.2",
                            "2.a.1",
                            "2.c.1",
                            "5.a.1",
                            "5.a.2",
                            "6.4.1",
                            "6.4.2",
                            "12.3.1",
                            "14.4.1",
                            "14.6.1",
                            "14.7.1",
                            "14.b.1",
                            "15.1.1",
                            "15.2.1",
                            "15.4.2",
                            "15.6.1")){

  #checks
  if(length(sdg) > 1) stop("Only one SDG indicator may be retrieved at a time")
  
  possible_sdgs <- c("2.1.1",
                     "2.1.2",
                     "2.3.1",
                     "2.3.2",
                     "2.5.1_Plants",
                     "2.5.1_Animals",
                     "2.5.2",
                     "2.a.1",
                     "2.c.1",
                     "5.a.1",
                     "5.a.2",
                     "6.4.1",
                     "6.4.2",
                     "12.3.1",
                     "14.4.1",
                     "14.6.1",
                     "14.7.1",
                     "14.b.1",
                     "15.1.1",
                     "15.2.1",
                     "15.4.2",
                     "15.6.1")
  
  if(!(sdg %in% possible_sdgs)) stop("SDG NOT FOUND")

  
  #create URLs for data downloads
  if (sdg == "2.1.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.1.1/2.1.1_March_2020.xlsx"
  } else if (sdg == "2.1.2"){ 
      url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.1.2/2.1.2_March_2020.xlsx"
  } else if (sdg == "2.3.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.3.1/2_3_1_DataExport_3_2019.xls"
  } else if (sdg == "2.3.2"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.3.2/2_3_2_DataExport_3_2019.xls"
  } else if (sdg == "2.5.1_Plants"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.5.1%20plants/2_5_1_Plants_DataExport_3_2019.xls"
  } else if (sdg == "2.5.1_Animals"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.5.1%20animals/2.5.1_animals_March_2020.xlsx"
  } else if (sdg == "2.5.2"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.5.2/2.5.2_March_2020.xlsx"
  } else if (sdg == "2.a.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.a.1/2.a.1_March_2020.xlsx"
  } else if (sdg == "2.c.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/2.c.1/2_c_1_DataExport_3_2019.xls"
  } else if (sdg == "5.a.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/5.a.1/5.a.1_a_b_March_2020.xlsx"
  } else if (sdg == "5.a.2"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/5.a.2/5.a.2_March_2020.xlsx"
  } else if (sdg == "6.4.1"){ 
    url <- "http://sdlc.fao.org/artifactory/fao-sdg-releases/6.4.1/6_4_1_DataExport_3_2019.xls"
  } else if (sdg == "6.4.2"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/6.4.2/6.4.2_March_2020.xlsx"
  } else if (sdg == "12.3.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/12.3.1/12.3.1.a_March_2020.xlsx"
  } else if (sdg == "14.4.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/14.4.1/14.4.1_March_2020.xlsx"
  } else if (sdg == "14.6.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/14.6.1/14_6_1_DataExport_3_2019.xls"
  } else if (sdg == "14.7.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/14.7.1/14_7_1_DataExport_7_2019.xls"
  } else if (sdg == "14.b.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/14.b.1/14_b_1_DataExport_3_2019.xls"
  } else if (sdg == "15.1.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/15.1.1/15_1_1_DataExport_3_2019.xls"
  } else if (sdg == "15.2.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/15.2.1/15_2_1_DataExport_3_2019.xls"
  } else if (sdg == "15.4.2"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/15.4.2/15_4_2_DataExport_3_2019.xls"
  } else if (sdg == "15.6.1"){ 
    url <- "https://sdlc.fao.org/artifactory/fao-sdg-releases/15.6.1/15.6.1_March_2020.xlsx"
  }
  
  
  #id file extension b/c some old files in xls
  if(grepl("xlsx", url)){
    dl_file <- tempfile(fileext = ".xlsx")
    
    download.file(url,
                  destfile = dl_file,
                  mode  = "wb",
                  quiet = T)
    
    df <- readxl::read_xlsx(dl_file,
                            #sheet = 1,
                            col_types = "text")
  } else {
    dl_file <- tempfile(fileext = ".xls")
    
    download.file(url,
                  destfile = dl_file,
                  mode  = "wb",
                  quiet = T)
    
    df <- readxl::read_xls(dl_file,
                            #sheet = 1,
                            col_types = "text")
    
  }
  
    
  
      
  #extract dataset, and version - NEED TO ADD VERSION WORKSHEETS
  # version <-readxl::read_xls(dl_file,
  #                            sheet = "version")
  # 
  # 
  # #add version column
  # version <- colnames(version)[1]
  # df$version <- version

df

}



