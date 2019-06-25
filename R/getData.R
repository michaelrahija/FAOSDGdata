#' getData
#' This is function which takes as an input an SDG indicator, and returns
#' the latest dataset for that indicator.
#'
#' @param sdg is a specific SDG indicator under FAO custodianship
#'
#' @return This function returns a dataframe containing the latest published data
#'
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
                            "6.4.1",
                            "6.4.2",
                            "14.4.1",
                            "14.6.1",
                            "14.b.1",
                            "15.1.1",
                            "15.2.1",
                            "15.4.2",
                            "15.6.1")){

  #checks
  if(length(sdg) > 1) stop("Only one SDG indicator may be retrieved at a time")

  #build uRL
  
  #custom URL for 2.5.1 plants
  if(sdg == "2.5.1_Plants"){
    url <-"http://sdlc.fao.org/artifactory/fao-sdg-releases/2.5.1%20plants/2_5_1_Plants_DataExport_3_2019.xls" 
    
  } else if (sdg == "2.5.1_Animals"){
    url <- "http://sdlc.fao.org/artifactory/fao-sdg-releases/2.5.1%20animals/2_5_1_Animals_DataExport_3_2019.xls"
    
  } else if (sdg %in% c("6.4.1", "6.4.2")){
    base_url <- sprintf("http://sdlc.fao.org/artifactory/fao-sdg-releases/%s/", sdg)
    mid_url <- gsub("\\.", "_", sdg)
    end_url <- paste0("_","DataExport_6_2019.xls")
    url <- paste0(base_url, mid_url,end_url)
    
  } else {
    base_url <- sprintf("http://sdlc.fao.org/artifactory/fao-sdg-releases/%s/", sdg)
    mid_url <- gsub("\\.", "_", sdg)
    end_url <- paste0("_","DataExport_3_2019.xls")
    url <- paste0(base_url, mid_url,end_url)
    
  }

  #download SDG file
  dl_file <- tempfile(fileext = ".xls")

  download.file(url,
                destfile = dl_file,
                mode  = "wb",
                quiet = T)

  df <- readxl::read_xls(dl_file,
                         sheet = 1)


df

}
