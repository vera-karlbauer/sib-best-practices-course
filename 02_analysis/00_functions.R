### Source functions ###
# (Shortened version for SIB Best Practices in Programming Course)

### Function 1: Loop simple linear model over 49 GpGs & return results

#' loop_lm_simple
#'
#' @param data a dataframe of methylation data and covariates with subject IDs as rows. Important: methylation data takes up first 49 columns, otherwise this will not work.
#' @param predictor_name character value specifiying column name in data for the main predictor of interest for which p values are returned
#' @param object_name character value specifiying name for the final dataframe with results
#'
#' @return dataframe with adjusted R, coefficients, p-values, fdr-adjusted p-values, and significance as "yes"/"no" per CpG site
#' @export
#'
#' @examples
#' # Differential methylation for genotype on dataset all_t0
#' loop_lm_simple(data = all_t0, predictor_name = "genotype", object_name = "diffmeth_geno_t0")

loop_lm_simple <- function(data, predictor_name, object_name){
  # set up results object with CpG names
  resultsobj <- cbind(colnames(data[1:49]),colnames(data[1:49]),colnames(data[1:49]),colnames(data[1:49]))
  # loop linear models over all GpGs
  for(i in 1:49){
    # linear model with pre-specified covariates
    # age, sex
    fit = lm(formula = data[,i] ~ data$age + data$Sex 
             # genetic components
             + data$C1 + data$C2 + data$C3 
             # cell type counts
             + data$CD14 + data$CD34 + data$Buccal 
             # prenatal smoke & alcohol exposure
             + data$smoke_exposure_score + data$alcohol_exposure_score 
             # predictor of interest
             + data[, predictor_name], data = environment())
    # extract summary measures
    s = summary(fit)
    resultsobj[i,2] = s$adj.r.squared
    resultsobj[i,3] = s$coefficients["data[, predictor_name]", "Pr(>|t|)"]
    resultsobj[i,4] = s$coefficients["data[, predictor_name]", "Estimate"]
  }
  # results object as data frame
  resultsobj <- as.data.frame(resultsobj)
  # rename columns in results object
  colnames(resultsobj) = c("CpG","adj.R","p", "coef")
  # set to numeric
  resultsobj <- resultsobj %>%
    mutate_at(c("adj.R", "p", "coef"), as.numeric)
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
  # name results object and write to global environment
  assign(object_name, resultsobj, env = .GlobalEnv)
  # print results object to console
  print(resultsobj)
}
