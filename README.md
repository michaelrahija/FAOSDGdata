# FAOSDG Data
## THIS PACKAGE IS NO LONGER MAINTAINED, AND THE SDG DATASETS ARE OLD DATASETS. ANYONE IS FREE TO TAKE OVER THIS REPOSITORY AND UPDATE ##
## Overview
This package provides functions to download and interact with the latest published SDG datasets from FAO. It is currently underdevelopment.

## Installation
```r
# To install this version, be sure you have devtools installed and run
devtools::install_github("michaelrahija/FAOSDGdata")
```

## Download SDG datasets

```r
#load package
library(FAOSDGdata)

#getData returns the dataset for a single SDG indicator
PoU <- getData("2.1.1")

#getDatasets returns a list of datasets corresponding to those specified as a parameter
dfs <- getDatasets(c("2.1.1", "2.1.2"))

#For retrieving all datasets, set all = T
all_sdgs <- getDatasets(all = T)

```

## Access M49 codes
There is a function which automatically scrapes the m49 countries and regions, with corresponding codes from the UNSD.

```r
raw_m49 <- scrape_m49()

```

## Harmonize M49 list with FAO adoptions, and column names with SDG template
For analyzing SDG data downloaded using this package, it may be useful adopt the M49 datasets to include FAO special classifications, and harmonize column names with the SDG data template. 

```r
clean_m49 <- adopt_m49_for_FAO(raw_m49)

```
