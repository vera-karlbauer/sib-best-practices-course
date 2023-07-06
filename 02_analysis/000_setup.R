### Setup

# wd
setwd("/Users/vera_karlbauer/Documents/sib-best-practices-course")

# libraries
library(rmarkdown)
library(dplyr)
library(testthat)
local_edition(3)

## import data
# all_t0 = methylation & covariates for T0
load("./01_data/all_t0.rda")
# all_t2 = methylation & covariates for T2
load("./01_data/all_t2.rda")
# all_time = methylation & covariates over both timepoints
load("./01_data/all_time.rda")