#' harmonizeIndicators
#' 
#' This is function which takes as a dataframe as input containing SDG data, and adds the
#' word the string ("(complementary)") next to the indicator variable for records which are
#' complementary SDG indicators and adds indexes to subindicators.
#'
#' @param sdgData a dataframe containing SDG data harvested with this package
#'
#' @return This function returns the dataframe with the indicator column amended
#'
#' @export

harmonizeIndicators <- function(sdgData){

  if(!("SERIESInd" %in% colnames(sdgData))) stop("Cannot find column containing indicators in input.")
    
    
    #15.2.1 5 sub indicators, add index number in indicator
    sdgData$SERIESInd[sdgData$SERIESDescription == "Forest area net change rate (%)"] <- "15.2.1 (1)" 
    
        #AD HOC FIX indicator name
        #sdgData$SERIESDescription[sdgData$SERIESDescription == "Above-ground biomass in forest per hectare (tonnes per hectare)"] <- "Above-ground biomass in forest, per hectare (tonnes/ha)" 
    
    sdgData$SERIESInd[sdgData$SERIESDescription == "Above-ground biomass in forest, per hectare (tonnes/ha)"] <- "15.2.1 (2)" 
    sdgData$SERIESInd[sdgData$SERIESDescription == "Proportion of forest area within legally established protected areas (%)"] <- "15.2.1 (3)" 
    sdgData$SERIESInd[sdgData$SERIESDescription == "Proportion of forest area with a long-term forest management plan (%)"] <- "15.2.1 (4)" 
    sdgData$SERIESInd[sdgData$SERIESDescription == "Forest area certified under an independently verified certification scheme (thousands of hectares)"] <- "15.2.1 (5)" 
    
    
    
    
    #2.1.1 Add "complementary" to number of indicators
    sdgData$SERIESInd[sdgData$SERIESDescription == "Number of undernourished people (millions)"] <- "2.1.1 (complementary)" 
    
    #2.5.1
    sdgData$SERIESInd[sdgData$SERIESDescription == "Percentage of animal genetic resources for food and agriculture secured in either medium or long-term conservation facilities"] <- "2.5.1 (animals)" 
    sdgData$SERIESInd[sdgData$SERIESDescription == "Plant genetic resources accessions stored ex situ (number)"] <- "2.5.1 (plants)" 
    
    #2.5.2
    sdgData$SERIESInd[sdgData$SERIESDescription == "Proportion of local breeds classified as being at risk, not-at-risk or at unknown level of risk of extinction"] <- "2.5.2 (complementary)" 
    
    #2.1.2
    sdgData$SERIESInd[sdgData$SERIESDescription == "Number of moderately or severely food insecure people, total with upper/lower bounds (thousands)"] <- "2.1.2 (complementary)" 
    sdgData$SERIESInd[sdgData$SERIESDescription == "Number of severely food insecure people, total with upper/lower bounds (thousands)"] <- "2.1.2 (complementary)" 
    sdgData$SERIESInd[sdgData$SERIESDescription == "Prevalence of severe food insecurity, total with upper/lower bounds (%)"] <- "2.1.2 (complementary)" 
    
    
sdgData  
  
}