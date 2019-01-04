#' Create a Boostrap 4 dashboard navbar
#'
#' Build a tabler dashboard page
#'
#' @param id Navbar id.
#' @param ... Navbar content.
#' @param src Brand image url or path.
#' @param navMenu Slot for \link{tablerNavMenu}
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerDashNav <- function(id, ..., src = NULL, navMenu) {

  headerTag <- shiny::tags$div(
    class = "header py-4",
    shiny::tags$div(
      class = "container",
      shiny::tags$div(
        class = "d-flex",
        # header brand
        shiny::tags$a(
          class = "header-brand",
          href = "#",
          shiny::img(src = src, class = "header-brand-img")
        ),
        # navbar content
        shiny::tags$div(class = "d-flex order-lg-2 ml-auto", ...),
        # header toggle
        shiny::tags$a(
          href = "#",
          class = "header-toggler d-lg-none ml-3 ml-lg-0",
          `data-toggle` = "collapse",
          `data-target` = paste0("#", id),
          shiny::tags$span(class="header-toggler-icon")
        )
      )
    )
  )

  navTag <- shiny::tags$div(
    class = "header collapse d-lg-flex p-0",
    id = id,
    shiny::tags$div(
      class = "container",
      shiny::tags$div(
        class = "row align-items-center",
        # navigation
        shiny::tags$div(
          class = "col-lg order-lg-first",
          navMenu
        )
      )
    )
  )
  shiny::tagList(headerTag, navTag)
}




#' Create a Boostrap 4 dashboard navbar menu
#'
#' Build a tabler dashboard main navbar menu
#'
#' @param ... Slot for \link{tablerNavMenuItem}.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerNavMenu <- function(...){
  shiny::tags$ul(
    class = "nav nav-tabs border-0 flex-column flex-lg-row",
    ...
  )
}




#' Create a Boostrap 4 dashboard navbar menu item
#'
#' Build a tabler dashboard navbar menu item
#'
#' @param ... Item name.
#' @param tabName Should correspond exactly to the tabName given in \code{\link{tablerTabItem}}.
#' @param icon Item icon.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerNavMenuItem <- function(..., tabName = NULL, icon = NULL) {
  shiny::tags$li(
    class = "nav-item",
    shiny::tags$a(
      class = "nav-link",
      id = paste0("tab-", tabName),
      href = paste0("#shiny-tab-", tabName),
      `data-toggle` = "tab",
      `data-value` = tabName,
      shiny::tags$i(class = paste0("fe fe-", icon)),
      shiny::tags$p(
        ...
      )
    )
  )
}
