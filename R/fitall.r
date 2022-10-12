#' Fit basic statistical models and summarize to Maths data
#'
#' @param obj An object of class \code{Analysis} from \code{\link{MathsData}}
#' @param fit_type The linear regression model(\code{lm}), summarize the model and data (\code{summarise_model}),(\code{summarise_data})
#'
#' @return Returns a list of class \code{db_fit} which includes the model details as well as the data set and fit type used or summary of data or summary of model
#' @export
#' @importFrom stats "lm"
#'
#' @examples
#' \dontrun{
#' path = system.file("extdata","Maths_ED.xlsx", package = "Analysis")
#' data = Analysis::MathsData(path)
#' ans1 = Analysis::fitall(data, 'lm')
#' }



fitall = function(obj, fit_type = c('lm', 'summarise_model','summarise_data')) {
  #Creating global variables
  Maths_Achievement = pred = VLE_Use = Gender_0F_1M = NULL
  #Getting data from previous MathsData Function
  lm_data = obj$data
  #Matching the arguments
  fit_arg = match.arg(fit_type)

  if(fit_arg == 'lm') {
    #fitting the model
    model <- lm(Maths_Achievement ~ .,data = lm_data)
  }
  if (fit_arg=='summarise_model'){
    #fitting and summarizing the model
    model1 <- lm(Maths_Achievement ~ .,data = lm_data)
    model <- summary(model1)
  }
  if (fit_arg=='summarise_data'){
    #summarizing the model
    model <- summary(lm_data)
  }
  mod = model
  print(mod)
  out = list(model = mod,
             data = obj$data,
             fit_type = fit_arg)
  class(out) = 'db_fit'

  invisible(out)

}
