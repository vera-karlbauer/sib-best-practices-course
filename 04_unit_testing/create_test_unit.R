### load packages
library(dplyr)
library(rmarkdown)

### source function
source("./02_analysis/00_functions.R")

### load data
# all_t0 = methylation & covariates for T0
load("./01_data/all_t0.rda")

### run function
# loop linear model with pre-specified covariates and maltreatment as main predictor over 49 CpGs
loop_lm_simple(data = all_t0, predictor_name = "Case.Control", object_name = "diffmeth_malt_t0")

### save resultsobject as .rda
save(loop_lm_simple, file = "04_unit_testing/resultsobj_malt_t0.Rda")
