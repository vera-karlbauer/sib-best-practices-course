### snapshot testing for loop_lm.simple
library(testthat)
local_edition(3)

setwd("~/Documents/sib-best-practices-course")

# source original function
source("02_analysis/01_functions/00_functions.R")

# source new function
# source("02_analysis/01_functions/analysis_lm_simple.R")

# write original snapshot
test_that("analysis_lm_simple", {
  expect_snapshot(loop_lm_simple(all_t0, "genotype"))
  expect_snapshot(loop_lm_simple(all_t2, "Case.Control"))
})

# write new snapshot
# test_that("analysis_lm_simple", {
#   expect_snapshot(analysis_lm_simple(all_t0, "genotype"))
#   expect_snapshot(analysis_lm_simple(all_t2, "Case.Control"))
# })