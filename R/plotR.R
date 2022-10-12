#' Plot packageMaths output
#'
#' @param path Give path in \code{MathsData} function
#' @param x Output from the \code{fit} function
#' @param VLE_Use An optional time grid for VLE_use over which to produce fitted values of the model
#' @param ... Other arguments to plot (not currently implemented)
#'
#' @return Nothing: just a nice plot
#' @export
#' @import ggplot2
#' @importFrom stats "predict"
#' @importFrom stats "runif"
#' @importFrom graphics "par"
#' @importFrom tibble "tibble"
#' @importFrom ggpubr "ggarrange"
#' @examples
#' \dontrun{
#' path = system.file("extdata","Maths_ED.xlsx", package = "Analysis")
#' data = Analysis::MathsData(path)
#' ans1 = Analysis::fitall(data, 'lm')
#' Analysis::plotR(ans1)
#' }


plotR = function(x, VLE_Use = pretty(x$data$VLE_Use, n = 100), ...) {
  Maths_Achievement = pred = VLE_Use = Gender_0F_1M = NULL

  # Get the data set out
  df = data.frame(x$data)
  VLE_Use = pretty(x$data$VLE_Use, n = 100)
  fit_arg = as.character(x$fit_type)
  #Generating data for prediction
  num <- runif(length(VLE_Use), 1, 10)
  Gender_0F_1M <- rep(NA,length(VLE_Use))
  #Randomly assigning boys and girls
  for (i in 1:length(VLE_Use)){
    if (num[i]<5){
      Gender_0F_1M[i] = 'Boys'
    }else{
      Gender_0F_1M[i] = 'Girls'
    }
  }
  # Finally create the plot
  if(fit_arg == "lm"){

    fits = tibble(Gender_0F_1M,VLE_Use, pred = predict(x$model, newdata = tibble(Gender_0F_1M,VLE_Use)))

    ggplot(df, aes(VLE_Use, Maths_Achievement)) +
      geom_point(aes(colour = Gender_0F_1M)) +
      theme_bw() +
      xlab('VLE Use') +
      ylab('Marks') +
      geom_line(data = fits, aes(x = VLE_Use, y = pred, colour = Gender_0F_1M)) +
      theme(legend.position = 'None')

  }
  else if(fit_arg == 'summarise_model'){
    model1 <- lm(Maths_Achievement ~ .,data = df)
    par(mfrow=c(2,2))
    plot(model1)
  }
  else if(fit_arg == 'summarise_data'){
    par(mfrow=c(2,1))
    p<-ggplot(df, aes(x=Gender_0F_1M, y= Maths_Achievement, fill=Gender_0F_1M)) +
      geom_boxplot()
    q<-ggplot(df, aes(x=Gender_0F_1M, y= VLE_Use, fill=Gender_0F_1M)) +
      geom_boxplot()
    ggarrange(p, q)
  }




}

