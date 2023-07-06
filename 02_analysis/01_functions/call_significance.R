call_significance_lm <- function(resultsobj){
  # add column calling uncorrected significance
  resultsobj <- mutate(resultsobj, 
                       sig_uncorrected = case_when(
                         p >= 0.05 ~ "no",
                         p < 0.05 ~ "yes")
                       )
  # correct p-values
  resultsobj$p_adjust <- as.numeric(p.adjust(p = resultsobj$p, method = "fdr"))
  # add columnn calling corrected significance
  resultsobj <- mutate(resultsobj, 
                       sig_corrected = case_when(
                         p_adjust >= 0.05 ~ "no",
                         p_adjust < 0.05 ~ "yes")
                       )
  # return
  return(resultsobj)
}