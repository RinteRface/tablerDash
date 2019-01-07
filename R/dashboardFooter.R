#' Create a Boostrap 4 dashboard footer
#'
#' Build an adminLTE3 dashboard footer
#'
#' @param ... Left text.
#' @param copyrights Copyrights, if any.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerDashFooter <- function(..., copyrights = NULL) {

  shiny::tags$footer(
    class = "footer",
    shiny::tags$div(
      class = "container",
      shiny::tags$div(
        class = "row align-items-center flex-row-reverse",
        # copyright left
        shiny::tags$div(
          class = "col-12 col-lg-auto mt-3 mt-lg-0 text-center",
          copyrights
        ),
        # right elements
        shiny::tags$div(
          class = "col-auto ml-lg-auto",
          shiny::tags$div(
            class = "row align-items-center",
            lapply(list(...), shiny::tagAppendAttributes, class = "mx-2")
          )
        )
      )
    )
  )
}
