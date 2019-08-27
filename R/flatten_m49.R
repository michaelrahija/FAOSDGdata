#' flatten_m49
#' 
#' This is function which takes as an input a dataframe containing data
#' which contains the raw M49 data from scrape_m49, or adopted for FAO, and flattens
#' it returning a dataframe with 3 columns containing the code, name, and level (region, 
#' intermediate region, subregion, global, or area)
#' 
#' @param m49df is a data frame referring to raw m49, or fao adapted m49
#'
#' @return This function returns a dataframe containing the flattened m49 data frame
#'
#' @importFrom dplyr select filter mutate
#' @export
#' 
#' #create dataframe with unique area names and codes
flatten_m49 <- function(m49df){
  
  regionclass <-
    c("global", "region", "subregion", "intermediateregion", "area")
  
  regionclasses <- list()
  
  for (i in 1:length(regionclass)) {
    code <- paste0(regionclass[i], "code")
    name <- paste0(regionclass[i], "name")
    
    df <- select(m49df, code, name) %>%
      unique() %>%
      filter(!is.na(code)) %>%
      mutate(level = regionclass[i])
    
    colnames(df) <- c("code", "name", "level")
    
    df <- filter(df,!is.na(code))
    
    regionclasses[[i]] <- df
    
  }
  
  flatm49 <- do.call("rbind", regionclasses)
  

flatm49  

}