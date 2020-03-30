#' getDatasets
#' 
#' This function takes a vector of SDG codes and returns a list inwhich
#' each element is the raw SDG data downloaded from the web. 
#'
#' @param sdgs_codes is a vector of codes corresponding to the SDG indicators
#' for which the user would like to download data. 
#' 
#' @param all is a boolean value equal to TRUE only if the user wants to download all
#' of the SDG datasets. 
#'
#' @return The functions returns a list wherein each element is a tibble corresponding
#' to the datasets requested in the input. 
#' 
#' @export
#'
getDatasets <- function(sdg_codes, 
                        all = FALSE){
  
  #check to see if input is valid
  sdgs <-c("2.1.1",
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
  
  
  if(all == T){
    result <- lapply(sdgs, function(x) getData(x))
  } else {
    
    if(sum(sdg_codes %in% sdgs) != length(sdg_codes)){ 
      
      stop("Input contains invalid SDG codes. Please check")
      
    } else {
      result <- lapply(sdg_codes, function(x) getData(x))
    }
    
  }
  
result
  
}