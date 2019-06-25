# FAOSDG Data

This package provides functions to download and interact withthe latest published SDG datasets from FAO. 
```{r, messages = FALSE}
library(devtools)
library(tidyverse)
library(readxl)

source("R/getData.R")
df <- getData("2.1.1")
head(df)

```
