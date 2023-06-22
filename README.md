# sib-best-practices-course
Code extract for SIB workshop "Best Practices in Programming".

## Project information:
This code extract is from a project where I investigate saliva methylation at 49 positions of a specific gene in a cohort of ~160 children. The main aim is to analyze the effects of childhood maltreatment (yes or no) on methylation. Additionally, methylation effects of other predictors like genotype or mental disorders are analyzed. During all analyses, the main predictor of interest or the measurement timepoint changes, but the strucure and covariates of the linear model stay the same. The code extract contains a function used to loop a linear model with pre-specified covariates over all 49 positions, and an analysis script applying the function to analyze maltreatment effects at the first measurement timepoint (T0).

## Code structure:
- **00_functions.R** contains a function used to loop a linear model with pre-specified covariates over 49 CpGs.
- **01_analysis.Rmd*** analyzes maltreatment effects at T0, runs summary statistics on the results, and exports the results as a table.
- **Data** cannot be shared in order to protect participants identity.  
