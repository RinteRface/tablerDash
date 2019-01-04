#' Create a Boostrap 4 dashboard body
#'
#' Build a tabler dashboard body
#'
#' @param ... Body content, slot for \link{tablerTabItems}.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerDashBody <- function(...) {
  shiny::tags$div(
    class = "my-3 my-md-5",
    shiny::tags$div(
      class = "container",
      ...
    )
  )
}




#' A container for tab items
#'
#' @param ... Items to put in the container. Each item should be a
#'   \code{\link{tablerTabItem}}.
#'
#' @export
tablerTabItems <- function(...) {
  lapply(list(...), tagAssert, class = "tab-pane")

  shiny::tags$div(class = "tab-content", ...)
}

#' One tab to put inside a tab items container
#'
#' @param tabName The name of a tab. This must correspond to the \code{tabName}
#'   of a \code{\link{tablerNavMenuItem}}.
#' @param ... Contents of the tab.
#'
#' @export
tablerTabItem <- function(tabName = NULL, ...) {
  if (is.null(tabName))
    stop("Need tabName")

  validateTabName(tabName)

  shiny::tags$div(
    role = "tabpanel",
    class = "tab-pane container-fluid",
    id = paste0("shiny-tab-", tabName),
    shiny::br(),
    ...
  )
}
