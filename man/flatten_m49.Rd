% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flatten_m49.R
\name{flatten_m49}
\alias{flatten_m49}
\title{flatten_m49}
\usage{
flatten_m49(m49df)
}
\arguments{
\item{m49df}{is a data frame referring to raw m49, or fao adapted m49}
}
\value{
This function returns a dataframe containing the flattened m49 data frame
}
\description{
This is function which takes as an input a dataframe containing data
which contains the raw M49 data from scrape_m49, or adopted for FAO, and flattens
it returning a dataframe with 3 columns containing the code, name, and level (region, 
intermediate region, subregion, global, or area).
}
