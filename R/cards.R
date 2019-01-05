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
#' @param collapsible Whether the card is collapsible. TRUE by default.
#' @param collapsed Whether to collapse the card at start. FALSE by default.
#' @param closable Whether the card is closable. TRUE by default.
#' @param zoomable Whether the card is zoomable. TRUE by default.
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
                       status = NULL, statusSide = c("top", "left"),
                       collapsible = TRUE, collapsed = FALSE, closable = TRUE,
                       zoomable = TRUE) {

  statusSide <- match.arg(statusSide)

  statusCl <- if (!is.null(status)) paste0("card-status bg-", status)
  if (!is.null(status)) {
    if (statusSide == "left") {
      statusCl <- paste0(statusCl , " card-status-left")
    }
  }

  cardCl <- "card"
  if (collapsed) cardCl <- paste0(cardCl, " card-collapsed")

  shiny::tags$div(
    class = cardCl,
    if (!is.null(status)) shiny::tags$div(class = statusCl),
    # header
    if (!is.null(title)) {
      shiny::tags$div(
        class = "card-header",
        shiny::tags$h3(class = "card-title", title),

        # card toolbox and other elements such as buttons, ...
        shiny::tags$div(
          class = "card-options",
          if (collapsible) {
            shiny::tags$a(
              href = "#",
              class = "card-options-collapse",
              `data-toggle` = "card-collapse",
              shiny::tags$i(class = "fe fe-chevron-up")
            )
          },
          if (zoomable) {
            if (closable) {
              shiny::tags$a(
                href = "#",
                class = "card-options-fullscreen",
                `data-toggle` = "card-fullscreen",
                shiny::tags$i(class = "fe fe-maximize")
              )
            }
          },
          if (closable) {
            shiny::tags$a(
              href = "#",
              class = "card-options-remove",
              `data-toggle` = "card-remove",
              shiny::tags$i(class = "fe fe-x")
            )
          },
          if (!is.null(options)) options
        )
      )
    },
    # body
    shiny::tags$div(class = "card-body", ...),
    # footer
    if (!is.null(footer)) shiny::tags$div(class = "card-footer", footer)
  )
}
