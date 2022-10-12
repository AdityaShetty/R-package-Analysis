
#' Animate Plot packageMaths output
#'
#' @param y Output from the \code{fitall} function
#'
#' @return Nothing: just a nice anime plot
#' @export
#' @import ggplot2
#' @import gganimate
#' @import gifski
#' @examples
#' \dontrun{
#' path = system.file("extdata","Maths_ED.xlsx", package = "packageMaths")
#' data = Analysis::MathsData(path)
#' ans1 = Analysis::fitall(data, 'lm')
#' Analysis::plotanime.db_fit(ans1)
#' }



plotanime.db_fit = function(y) {
  Maths_Achievement = pred = VLE_Use = Gender_0F_1M = NULL
  df <- y$data
  p = ggplot( df,aes(x=Maths_Achievement, y=VLE_Use,color=Gender_0F_1M)) +
    geom_point(size=2,color='red')  +
    theme_dark()+ transition_time(Maths_Achievement) +
    labs(title = "Maths Score: {frame_time}", x = "Score", y ="VLE Use")

  animate(p, duration = 5, fps = 20, width = 500, height = 500, renderer = gifski_renderer())

}


