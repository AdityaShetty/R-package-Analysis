#' Run Shiny application for the Analysis package
#'
#' @return Runs the Shiny application for the Analysis package
#' @export
#' @importFrom shiny "runApp"
run_Example <- function() {
  appDir <- system.file("shiny-examples", "myapp", package = "Analysis")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `packageMaths`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
