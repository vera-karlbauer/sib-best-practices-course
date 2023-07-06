modify_lm <- function(resultsobj){
# results object as data frame
resultsobj <- as.data.frame(resultsobj)
# rename columns in results object
resultsobj <- resultsobj %>%
  rename(
    CpG = V1,
    adj.R = V2,
    p = V3,
    coef = V4
  )  %>%

# set to numeric
resultsobj <- resultsobj %>%
  mutate(across(! "CpG"), as.numeric)
}

