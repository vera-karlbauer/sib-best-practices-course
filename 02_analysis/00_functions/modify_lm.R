modify_lm <- function(resultsobj){
# results object as data frame
resultsobj <- as.data.frame(resultsobj)
# rename columns in results object
resultsobj <- resultsobj %>%
  rename(
    CpG = V1,
    adj.R = V2,
    p = V2
  )  %>%
  rename_with()

# set to numeric
resultsobj <- resultsobj %>%
  mutate_at(c("adj.R", "p", "coef"), as.numeric)
}