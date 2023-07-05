# load packages
library(dplyr)
library(rmarkdown)
library(diffr)

# load results to test against
load("04_unit_testing/resultsobj_for_testing.Rda")

# load data
load("01_data/all_t0.Rda")

### loop_lm_simple

# source loop_lm_simple function
source("02_analysis/00_functions/loop_lm_simple.R")

# run function on data
resultsobj <- loop_lm_simple(data = all_t0, predictor_name = "Case.Control")

# test whether CpG names are identical
diffmeth_malt_t0[, 1] == resultsobj[, 1]

# test whether adjusted R squared output is identical
diffmeth_malt_t0[, 2] == resultsobj[, 2]

# test whether p value output is identical
diffmeth_malt_t0[, 3] == resultsobj[, 3]

# test whether coefficient output is identical
diffmeth_malt_t0[, 4] == resultsobj[, 4]

### modify_lm


### call_significance_lm


### analysis_lm_simple


### write_pubtable_lm
