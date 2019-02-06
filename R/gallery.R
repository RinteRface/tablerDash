#' @title Launch the tablerDash Gallery
#'
#' @description A gallery of all components available in tablerDash.
#'
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'
#'  tablerDashGallery()
#'
#' }
tablerDashGallery <- function() { # nocov start
  if (!requireNamespace(package = "shinyWidgets"))
    message("Package 'shinyWidgets' is required to run this function")
  if (!requireNamespace(package = "shinyEffects"))
    message("Package 'shinyEffects' is required to run this function")
  if (!requireNamespace(package = "echarts4r"))
    message("Package 'echarts4r' is required to run this function")

  shiny::shinyAppFile(
    system.file(
      "examples/tabs/app.R",
      package = 'tablerDash',
      mustWork = TRUE
    )
  )
}
