# FAOSDG Data

## Overview
This package provides functions to download and interact with the latest published SDG datasets from FAO. It is currently underdevelopment.

## Installation
```r
# To install this version, be sure you have devtools installed and run
devtools::install_github("michaelrahija/FAOSDGdata")
```

## Download SDG datasets

```r

#getData returns the dataset for a single SDG indicator
PoU <- getData("2.1.1")

#getDatasets returns a list of datasets corresponding to those specified as a parameter
dfs <- getDatasets(c("2.1.1", "2.1.2"))

#For retrieving all datasets, set all = T
all_sdgs <- getDatasets(all = T)

```

## Access M49 codes
There is dataset called m49 which is embedded in the package which provides the complete list of M49 countries, territories, regions, and codes. You can access with the following:

```r
#load package
library(FAOSDGdata)
head(m49)

```