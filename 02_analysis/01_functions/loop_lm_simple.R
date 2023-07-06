loop_lm_simple <- function(data, predictor_name){
  # set up results object with CpG names
  resultsobj <- cbind(colnames(data[1:49]),colnames(data[1:49]),colnames(data[1:49]),colnames(data[1:49]))
  # rename columns of resultsobject
  colnames(resultsobj) <- c("CpG","adj.R","p", "coef")
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
  return(resultsobj)
}