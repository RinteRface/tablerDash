#' Create a Boostrap 4 card
#'
#' Build a tabler card
#'
#' @param ... Body content
#' @param title Card title. If NULL, the header is not displayed.
#' @param options Card extra header elements.
#' @param footer Card footer. NULL by default. Not displayed if NULL.
#' @param status Card status. NULL by default. See \link{https://preview.tabler.io/docs/colors.html} for valid statuses.
#' @param statusSide Status side: "top" or "left".
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(tablerDash)
#'
#'  shiny::shinyApp(
#'    ui = tablerDashPage(
#'     navbar = NULL,
#'     footer = NULL,
#'     title = "test",
#'     body = tablerDashBody(
#'      tablerCard(
#'       title = "Card",
#'       "Inside the card",
#'       status = "success",
#'       statusSide = "left"
#'      )
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerCard <- function(..., title = NULL, options = NULL, footer = NULL,
                       status = NULL, statusSide = c("top", "left")) {

  statusSide <- match.arg(statusSide)

  statusCl <- if (!is.null(status)) paste0("card-status bg-", status)
  if (!is.null(status)) {
    if (statusSide == "left") {
      statusCl <- paste0(statusCl , " card-status-left")
    }
  }

  shiny::tags$div(
    class = "card",
    if (!is.null(status)) shiny::tags$div(class = statusCl),
    # header
    if (!is.null(title)) {
      shiny::tags$div(
        class = "card-header",
        shiny::tags$h3(class = "card-title", title),
        if (!is.null(options)) {
          shiny::tags$div(
            class = "card-options",
            options
          )
        }
      )
    },
    # body
    shiny::tags$div(class = "card-body", ...),
    # footer
    if (!is.null(footer)) shiny::tags$div(class = "card-footer", footer)
  )
}
