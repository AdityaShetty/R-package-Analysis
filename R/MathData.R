#' Loading Maths data
#'
#'
#' @param path Give path in \code{MathsData} function
#' @return A \code{\link[tibble]{tibble}} which contains 3 columns Gender,Maths scores and VLE use
#' @export
#' @importFrom readxl "read_excel"
#' @importFrom stats "median"
#'
#' @examples
#'
#' path = system.file("extdata","Maths_ED.xlsx", package = "Analysis")
#' data = Analysis::MathsData(path)
#'

MathsData = function(path) {
  #Setting arguement to show what this function returns
  arg = c('Maths_Data')
  #Taking data from path
  data = read_excel(path)
  data <- data.frame(data)
  data$VLE_Use[is.na(data$VLE_Use)] <- median(data$VLE_Use, na.rm=TRUE)
  #Taking only three highly correlated variables
  data = data[,c(1,3,4)]
  data$Gender_0F_1M = factor(data$Gender_0F_1M, labels =  c('Boys', 'Girls'))
  data_list = list(data = data, type = arg)
  class(data_list) = 'db'
  return(data_list)
}
