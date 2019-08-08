#' scrape_m49
#' This scrapes the m49 geoclassification from the UNSD website. 
#' The URL of the classification is https://unstats.un.org/unsd/methodology/m49/overview/#.
#'
#'
#' @return This function returns a dataframe containing the m49 classification
#' exactly as scraped from the UNSD website.
#'
#' @importFrom httr GET
#' @importFrom rvest html_nodes html_table
#' @export


scrape_m49 <- function(){
  
  url <- "https://unstats.un.org/unsd/methodology/m49/overview/#"
  website1 <- httr::GET(url)
  
  if(website1$status_code != 200) stop("Website returned error. Check URL for M49 scraping")
  
  
  tbls <- rvest::html_nodes(content(website1), "table")
  m49 <-rvest::html_table(tbls[[1]],
                   fill=F,
                   header = T)
m49
}
