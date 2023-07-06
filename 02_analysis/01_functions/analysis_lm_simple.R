source("02_analysis/01_functions/loop_lm_simple.R")
source("02_analysis/01_functions/modify_resultsobj.R")
source("02_analysis/01_functions/call_significance.R")

analysis_lm_simple <- function(data, predictor_name){
  resultsobj <- loop_lm_simple(data, predictor_name)
  resultsobj <- modify_lm(resultsobj)
  resultsobj <- call_significance_lm(resultsobj)
  return(resultsobj)
}