#' Create a Boostrap 4 timeline
#'
#' Build a tabler timeline
#'
#' @param ... slot for \link{tablerTimelineItem}.
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
#'      tablerTimeline(
#'       tablerTimelineItem(
#'        title = "Item 1",
#'        status = "green",
#'        date = "now"
#'       ),
#'       tablerTimelineItem(
#'        title = "Item 2",
#'        status = NULL,
#'        date = "yesterday",
#'        "Lorem ipsum dolor sit amet,
#'        consectetur adipisicing elit."
#'       )
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
tablerTimeline <- function(...) {
  shiny::tags$ul(class = "timeline", ...)
}




#' Create a Boostrap 4 timeline item
#'
#' Build a tabler timeline item
#'
#' @param ... Item content.
#' @param title Item title.
#' @param status Item status.
#' @param date Event date.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerTimelineItem <- function(..., status = NULL, title, date) {

  badgeCl <- "timeline-badge"
  if (!is.null(status)) badgeCl <- paste0(badgeCl, " bg-", status)

  shiny::tags$li(
    class = "timeline-item",
    # badge
    shiny::tags$div(class = badgeCl),
    shiny::tags$div(
      # title
      shiny::tags$strong(title),
      # content
      if (length(list(...)) > 0) htmltools::tags$small(class = "d-block text-muted", ...)
    ),
    # date
    shiny::tags$div(class = "timeline-time text-muted-dark", date)
  )
}
