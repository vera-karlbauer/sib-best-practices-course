fizz_buzz <- function(n) {
  if((n %% 3 == 0) & (n %% 5 == 0)) return("fizz_buzz");
  if(n %% 3 == 0) return("fizz");
  if(n %% 5 == 0) return("buzz");
  return(as.character(n))
}
