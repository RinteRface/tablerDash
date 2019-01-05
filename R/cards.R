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
#' @param width Card width. 6 by default. See Bootstrap grid system. If NULL, the card is
#' full width.
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
#'       sliderInput("obs", "Number of observations:",
#'       min = 0, max = 1000, value = 500
#'       ),
#'       plotOutput("distPlot"),
#'       status = "success",
#'       statusSide = "left"
#'      )
#'     )
#'    ),
#'    server = function(input, output) {
#'    output$distPlot <- renderPlot({
#'     hist(rnorm(input$obs))
#'    })
#'   }
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerCard <- function(..., title = NULL, options = NULL, footer = NULL,
                       status = NULL, statusSide = c("top", "left"),
                       collapsible = TRUE, collapsed = FALSE, closable = TRUE,
                       zoomable = TRUE, width = 6) {

  statusSide <- match.arg(statusSide)

  statusCl <- if (!is.null(status)) paste0("card-status bg-", status)
  if (!is.null(status)) {
    if (statusSide == "left") {
      statusCl <- paste0(statusCl , " card-status-left")
    }
  }

  cardCl <- "card"
  if (collapsed) cardCl <- paste0(cardCl, " card-collapsed")

  cardTag <- shiny::tags$div(
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
          if (!is.null(options)) options,
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
          }
        )
      )
    },
    # body
    shiny::tags$div(class = "card-body", ...),
    # footer
    if (!is.null(footer)) shiny::tags$div(class = "card-footer", footer)
  )

  if (!is.null(width)) shiny::column(width = width, cardTag) else cardTag

}




#' Create a Boostrap 4  stat card
#'
#' Build a tabler stat card
#'
#' @param value Card value.
#' @param title Card title.
#' @param trend Percentage increase/decrease.
#' @param width Card width. 3 by default.
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
#'      tablerStatCard(
#'       value = 43,
#'       title = "Followers",
#'       trend = -10
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
tablerStatCard <- function(value, title, trend = NULL, width = 3) {

  color <- ifelse(trend > 0, "green", "red")

  shiny::column(
    width = width,
    shiny::tags$div(
      class = "card",
      shiny::tags$div(
        class = "card-body p-3 text-center",
        if (!is.null(trend)) {
          shiny::tags$div(
            class = paste0("text-right text-", color),
            paste0(trend, "%"),
            if (trend > 0) {
              shiny::tags$i(class = "fe fe-chevron-up")
            } else {
              shiny::tags$i(class = "fe fe-chevron-down")
            }
          )
        },
        shiny::tags$div(class = "h1 m-0", value),
        shiny::tags$div(class = "text-muted mb-4", title)
      )
    )
  )
}




#' Create a Boostrap 4 info card
#'
#' Build a tabler info card
#'
#' @param value Card value.
#' @param description Percentage increase/decrease.
#' @param status Card status.
#' @param icon Card icon.
#' @param href External link.
#' @param width Card width. 4 by default.
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
#'      tablerInfoCard(
#'       value = "132 sales",
#'       status = "danger",
#'       icon = "dollar-sign",
#'       description = "12 waiting payments"
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
tablerInfoCard <- function(value, description = NULL, status,
                           icon, href = NULL, width = 4) {

  shiny::column(
    width = width,
    shiny::tags$div(
      class = "card p-3",
      # stamp
      shiny::tags$div(
        class = "d-flex align-items-center",
        shiny::tags$span(
          class = paste0("stamp stamp-md mr-3 bg-", status),
          shiny::tags$i(class = paste0("fe fe-", icon))
        ),
        # body
        shiny::tags$div(
          shiny::tags$h4(
            class = "m-0",
            shiny::tags$a(href = if (!is.null(href)) href else "#", value)
          ),
          htmltools::tags$small(class = "text-muted", description)
        )
      )
    )
  )
}
