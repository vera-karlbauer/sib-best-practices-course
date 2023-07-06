## set wd (this is necessary even if you ran the setup script before)
setwd("/Users/vera_karlbauer/Documents/sib-best-practices-course")

## source functions
# old
source("02_analysis/01_functions/00_functions.R")
# new
source("02_analysis/01_functions/analysis_lm_simple.R")

## write function output
# old testcase 1
results_old_test_1 <- as.data.frame(loop_lm_old(data = all_t0, predictor_name = "Case.Control"))

# old testcase 2
results_old_test_2 <- as.data.frame(loop_lm_old(data = all_t2, predictor_name = "genotype"))

# new testcase 1
results_new_test_1 <- analysis_lm_simple(data = all_t0, predictor_name = "Case.Control")

# new testcase 2
results_new_test_2 <- analysis_lm_simple(data = all_t2, predictor_name = "genotype")

## compare equality of results
# testcase 1
expect_equal(results_new_test_1, results_old_test_1)

# testcase 2
expect_equal(results_new_test_2, results_old_test_2)
