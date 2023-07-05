# load packages
library(dplyr)
library(rmarkdown)
library(diffr)

# load results to test against
load("04_unit_testing/resultsobj_for_testing.Rda")

# load data
load("01_data/all_t0.Rda")

# source function
source("02_analysis/00_functions/setup_resultsobj.R")

# run function on data
resultsobj <- setup_resultsobj(data = all_t0)

# test whether first column is identical
diffmeth_malt_t0[, 1] == resultsobj[,1]

