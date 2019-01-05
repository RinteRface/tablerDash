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




#' Create a Boostrap 4 avatar list
#'
#' Build a tabler avatar list
#'
#' @param ... Slot for \link{tablerAvatar}.
#' @param stacked Whether to stack avatars. FALSE by default.
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
#'      tablerAvatarList(
#'       stacked = TRUE,
#'       tablerAvatar(
#'        name = "DG",
#'        size = "xxl"
#'       ),
#'       tablerAvatar(
#'        name = "DG",
#'        color = "orange"
#'       ),
#'       tablerAvatar(
#'        name = "DG",
#'        status = "warning"
#'       ),
#'       tablerAvatar(url = "https://image.flaticon.com/icons/svg/145/145852.svg")
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
tablerAvatarList <- function(..., stacked = FALSE) {

  listCl <- "avatar-list"
  if (stacked) listCl <- paste0(listCl, " avatar-list-stacked")

  shiny::tags$div(class = listCl, ...)
}



#' Create a Boostrap 4 avatar
#'
#' Build a tabler avatar
#'
#' @param name Avatar placeholder. If not NULL, url cannot be used.
#' @param url Avatar image if any. If not NULL, name cannot be used.
#' @param size Avatar size. NULL, "sm", "md", "lg", "xl" or "xxl".
#' @param status Avatar status. See \link{https://preview.tabler.io/docs/colors.html}
#' for valid statuses.
#' @param color Avatar background color. See \link{https://preview.tabler.io/docs/colors.html}
#' for valid colors.
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
#'      tablerAvatar(
#'       name = "DG",
#'       size = "xxl"
#'      ),
#'      tablerAvatar(
#'       name = "DG",
#'       color = "orange"
#'      ),
#'      tablerAvatar(
#'       name = "DG",
#'       status = "warning"
#'      ),
#'      tablerAvatar(url = "https://image.flaticon.com/icons/svg/145/145852.svg")
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerAvatar <- function(name = NULL, url = NULL,
                         size = NULL, status = NULL, color = NULL) {

  if (!is.null(name)) url <- NULL
  if (!is.null(url)) name <- NULL

  avatarCl <- "avatar"
  if (!is.null(size)) avatarCl <- paste0(avatarCl, " avatar-", size)
  if (!is.null(color)) avatarCl <- paste0(avatarCl, " avatar-", color)

  shiny::tags$span(
    class = avatarCl,
    name,
    # image if any
    style = if (!is.null(url)) paste0("background-image: url(\"", url, "\")"),
    # status
    if (!is.null(status)) shiny::tags$span(class = paste0("avatar-status bg-", status))
  )
}




#' Create a Boostrap 4 tag list
#'
#' Build a tabler tag list
#'
#' @param ... Slot for \link{tablerTag}.
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
#'      tablerTagList(
#'       lapply(X = 1:5, FUN = function(i) {
#'        tablerTag(name = i)
#'       })
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
tablerTagList <- function(...) {
  shiny::tags$div(class = "tags", ...)
}




#' Create a Boostrap 4 tag
#'
#' Build a tabler tag
#'
#' @param name Tag name.
#' @param href Tag external link.
#' @param rounded Whether the tag is rounded. FALSE by default.
#' @param color Tag color. See \link{https://preview.tabler.io/docs/colors.html}.
#' @param addon Tag addon (right side).
#' @param addonColor Addon background color. See \link{https://preview.tabler.io/docs/colors.html}.
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
#'      tablerTag(name = "Tag"),
#'      tablerTag(name = "Tag", href = "https://www.google.com"),
#'      tablerTag(name = "Tag", rounded = TRUE, color = "pink"),
#'      tablerTag(
#'       name = "npm",
#'       href = "https://www.google.com",
#'       color = "dark",
#'       addon = "passing",
#'       addonColor = "warning"
#'      ),
#'      tablerTag(name = "build", addon = "passing", addonColor = "success")
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerTag <- function(name, href = NULL, rounded = FALSE, color = NULL,
                      addon = NULL, addonColor = NULL) {

  tagCl <- "tag"
  if (rounded) tagCl <- paste0(tagCl, " tag-rounded")
  if (!is.null(color)) tagCl <- paste0(tagCl, " tag-", color)

  addonCl <- "tag-addon"
  if (!is.null(addonColor)) addonCl <- paste0(addonCl, " tag-", addonColor)

  if (!is.null(href)) {
    shiny::tags$a(
      href = href,
      target = "_blank",
      class = tagCl,
      name,
      if (!is.null(addon)) shiny::tags$span(class = addonCl, addon)
    )
  } else {
    if (!is.null(addon)) {
      shiny::tags$div(
        class = tagCl,
        name,
        shiny::tags$span(class = addonCl, addon)
      )
    } else {
      shiny::tags$span(
        class = tagCl,
        name
      )
    }
  }
}
