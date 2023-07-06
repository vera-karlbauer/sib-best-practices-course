### snapshot testing for loop_lm.simple
library(testthat)
local_edition(3)

setwd("~/Documents/sib-best-practices-course")

# source original function
source("02_analysis/00_functions/loop_lm_simple.R")

# import data
load("01_data/all_t0.rda")

# write original snapshot
test_that("loop_lm_simple", {
  expect_snapshot(loop_lm_simple(all_t0, "genotype"))
})


# # source new function
# source("02_analysis/00_functions/loop_lm_simple.R")
# 
# 
# test_that("loop_lm_simple", {
#   expect_snapshot(loop_lm_simple(all_t0, "genotype"))
# })

