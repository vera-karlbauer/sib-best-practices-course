source("02_analysis/01_functions/loop_lm_simple.R")
source("02_analysis/01_functions/modify_resultsobj.R")
source("02_analysis/01_functions/call_significance.R")

analysis_lm_simple <- function(data, predictor_name){
  loop_lm_simple(data)
  modify_lm(resultsobj)
  call_significance_lm(resultsobj)
  return(resultsobj)
}
  