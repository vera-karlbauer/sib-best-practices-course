modify_lm <- function(resultsobj){
# results object as data frame
resultsobj <- as.data.frame(resultsobj)
# set to numeric
resultsobj <- resultsobj %>%
  mutate(across(! "CpG"), as.numeric)
# return
return(resultsobj)
}

