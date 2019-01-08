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
tablerDashNav <- function(id, ..., src = NULL, navMenu = NULL) {

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
        shiny::tags$div(
          class = "d-flex order-lg-2 ml-auto",
          lapply(list(...), shiny::tagAppendAttributes, class = "mx-2")
        ),
        # header toggle
        if (!is.null(navMenu)) {
          shiny::tags$a(
            href = "#",
            class = "header-toggler d-lg-none ml-3 ml-lg-0",
            `data-toggle` = "collapse",
            `data-target` = paste0("#", id),
            shiny::tags$span(class="header-toggler-icon")
          )
        }
      )
    )
  )

  navTag <- if (!is.null(navMenu)) {
    shiny::tags$div(
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
  }

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
      tablerIcon(name = icon, lib = "feather"),
      ...
    )
  )
}





#' Create a Boostrap 4 dashboard dropdown container
#'
#' Build a tabler dashboard dropdown container
#'
#' @param ... Slot for \link{tablerDropdownItem}.
#' @param icon Dropdown icon.
#' @param collapsed Whether to collapse the dropdown. TRUE by default.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerDropdown <- function(..., icon = "bell", collapsed = TRUE) {

  shiny::tags$div(
    class = "dropdown d-none d-md-flex",
    # link and icon
    shiny::tags$a(
      class = "nav-link icon",
      `data-toggle` = "dropdown",
      `aria-expanded` = if (collapsed) "false" else "true",
      tablerIcon(name = icon, lib = "feather"),
      shiny::span(class = "nav-unread")
    ),
    # dropdown content
    shiny::tags$div(
      class = "dropdown-menu dropdown-menu-right dropdown-menu-arrow",
      `x-placement` = "bottom-end",
      style = "position: absolute;
      transform: translate3d(39px, 32px, 0px);
      top: 0px; left: 0px; will-change: transform;",
      ...
    )
  )
}




#' Create a Boostrap 4 dashboard dropdown container
#'
#' Build a tabler dashboard dropdown container
#'
#' @param ... Item content.
#' @param title Item title.
#' @param href External link.
#' @param url Author image.
#' @param status Item status. Only if url is not NULL.
#' @param date Item date.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerDropdownItem <- function(..., title = NULL, href = NULL,
                               url = NULL, status = NULL, date = NULL) {
  shiny::tags$a(
    href = href,
    target = "_blank",
    class = "dropdown-item d-flex",
    if (!is.null(url)) {
     shiny::tagAppendAttributes(
       tablerAvatar(url = url, status = status),
       class = "mr-3"
     )
    },
    shiny::tags$div(
      if (!is.null(title)) shiny::strong(paste0(title, ": ")),
      ...,
      shiny::tags$div(class = "small text-muted", date)
    )
  )
}
