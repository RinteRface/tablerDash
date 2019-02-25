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
#' @param status Avatar status. See \url{https://preview.tabler.io/docs/colors.html}
#' for valid statuses.
#' @param color Avatar background color. See \url{https://preview.tabler.io/docs/colors.html}
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
#' @param color Tag color. See \url{https://preview.tabler.io/docs/colors.html}.
#' @param addon Tag addon (right side).
#' @param addonColor Addon background color. See \url{https://preview.tabler.io/docs/colors.html}.
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




#' Create a Boostrap 4 alert
#'
#' Build a tabler alert
#'
#' @param ... Alert content.
#' @param title Alert title.
#' @param status Alert status. See \url{https://preview.tabler.io/docs/colors.html}.
#' @param icon Alert icon.
#' @param closable Whether to close the alert. TRUE by default.
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
#'      tablerAlert(
#'       title = "Alert",
#'       "Lorem ipsum dolor sit amet, consectetur
#'       adipisicing elit. Lorem ipsum dolor sit
#'       amet, consectetur adipisicing elit.
#'       Lorem ipsum dolor sit amet, consectetur
#'       adipisicing elit.",
#'       icon = "alert-triangle",
#'       status = "info"
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
tablerAlert <- function(..., title = NULL, status, icon = NULL, closable = TRUE) {

  alertCl <- paste0("alert alert-", status)
  if (!is.null(icon)) alertCl <- paste0(alertCl, " alert-icon")
  if (closable) alertCl <- paste0(alertCl, " alert-dismissible")

  shiny::tags$div(
    class = alertCl,
    role = "alert",
    if (!is.null(title)) shiny::tags$h4(title),
    # closable or not
    if (closable) {
      shiny::tags$button(
        type = "button",
        class = "close", `data-dismiss` = "alert"
      )
    },
    shiny::tagAppendAttributes(
      tablerIcon(name = icon, lib = "feather"),
      `aria-hidden` = "true"
    ),
    ...
  )
}




#' Create a Boostrap 4 status
#'
#' Build a tabler status
#'
#' @param color Status color. See \url{https://preview.tabler.io/docs/colors.html}.
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
#'      tablerStatus(color = "lime")
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerStatus <- function(color) {
  shiny::tags$span(class = paste0("status-icon bg-", color))
}





#' Create a Boostrap 4 social link list
#'
#' Build a tabler social link list
#'
#' @param ... Slot for \link{tablerSocialLink}.
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
#'      tablerSocialLinks(
#'        tablerSocialLink(
#'         name = "facebook",
#'         href = "https://www.facebook.com",
#'         icon = "facebook"
#'        ),
#'        tablerSocialLink(
#'         name = "twitter",
#'         href = "https://www.twitter.com",
#'         icon = "twitter"
#'        )
#'       )
#'     )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerSocialLinks <- function(...) {
  shiny::tags$ul(class = "social-links list-inline mb-0 mt-2", ...)
}





#' Create a Boostrap 4 social link
#'
#' Build a tabler social link
#'
#' @param name Link tooltip name.
#' @param href External link.
#' @param icon Icon (font awesome).
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerSocialLink <- function(name = NULL, href = NULL, icon) {
  shiny::tags$li(
    class = "list-inline-item",
    shiny::a(
      href = href,
      target = "_blank",
      title = "",
      `data-toggle` = "tooltip",
      `data-original-title` = name,
      shiny::tags$i(class = paste0("fa fa-", icon))
    )
  )
}





#' Create a Boostrap 4 progress bar
#'
#' Build a tabler progress bar
#'
#' @param value Progress value.
#' @param status Progress status. See \url{https://preview.tabler.io/docs/colors.html}.
#' @param size Progress bar size: NULL, "xs", "sm", "md".
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
#'       tablerProgress(value = 10, size = "xs"),
#'       tablerProgress(value = 90, status = "red", size = "sm")
#'      )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerProgress <- function(value, status = NULL, size = NULL) {

  progressCl <- "progress m-2"
  if (!is.null(size)) progressCl <- paste0(progressCl, " progress-", size)

  barCl <- "progress-bar"
  if (!is.null(status)) barCl <- paste0(barCl, " bg-", status)

  shiny::tags$div(
    class = progressCl,
    shiny::tags$div(
      class = barCl,
      style = paste0("width: ", value, "%")
    )
  )
}




#' Create a Boostrap 4 list container
#'
#' Build a tabler list container
#'
#' @param ... Slot for \link{tablerListItem}.
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
#'       tablerCard(
#'        title = "tablerList",
#'        tablerList(
#'        tablerListItem(
#'         tablerTag(name = "Tag"),
#'         tablerTag(name = "Tag", href = "https://www.google.com"),
#'         tablerTag(name = "Tag", rounded = TRUE, color = "pink")
#'        ),
#'        tablerListItem(tablerStatus(color = "red")),
#'        tablerListItem(
#'         tablerAvatarList(
#'          stacked = TRUE,
#'          tablerAvatar(
#'            name = "DG",
#'            size = "xxl"
#'          ),
#'          tablerAvatar(
#'            name = "DG",
#'            color = "orange"
#'          ),
#'          tablerAvatar(
#'            name = "DG",
#'            status = "warning"
#'          ),
#'          tablerAvatar(url = "https://image.flaticon.com/icons/svg/145/145852.svg")
#'          )
#'         )
#'        )
#'       )
#'      )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerList <- function(...) {
  shiny::tags$ul(class = "list-unstyled list-separated", ...)
}



#' Create a Boostrap 4 list item
#'
#' Build a tabler list item
#'
#' @param ... Slot for any HTML element.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerListItem <- function(...) {
  shiny::tags$li(
    class = "list-separated-item",
    shiny::div(class = "row align-items-center", ...)
  )
}



#' Create a Boostrap 4 table container
#'
#' Build a tabler table container
#'
#' @param ... Slot for \link{tablerTableItem}.
#' @param title Card wrapper title.
#' @param width Card wrapper width.
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
#'        tablerTable(
#'         title = "tablerTable",
#'         tablerTableItem(
#'          left = tablerTag(name = "Tag"),
#'          right = tablerTag(name = "Tag", href = "https://www.google.com")
#'         ),
#'         tablerTableItem(right = tablerStatus(color = "red")),
#'         tablerTableItem(
#'          left = tablerAvatarList(
#'           stacked = TRUE,
#'           tablerAvatar(
#'            name = "DG",
#'            size = "xxl"
#'           ),
#'           tablerAvatar(
#'            name = "DG",
#'            color = "orange"
#'           ),
#'           tablerAvatar(
#'            name = "DG",
#'            status = "warning"
#'           ),
#'           tablerAvatar(url = "https://image.flaticon.com/icons/svg/145/145852.svg")
#'           )
#'          )
#'        )
#'      )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerTable <- function(..., title = NULL, width = 4) {

  wrapper <- tablerCard(
    title = title,
    width = width,
    closable = FALSE,
    collapsible = FALSE,
    zoomable = FALSE
  )

  wrapper$children[[1]]$children[[2]]$children[[2]] <- NULL
  wrapper$children[[1]]$children[[3]] <- NULL

  tableTag <- shiny::tags$table(
    class="table card-table",
    shiny::tags$tbody(...)
  )

  shiny::tagAppendChild(wrapper$children[[1]], tableTag)

}


#' Create a Boostrap 4 table item
#'
#' Build a tabler table item
#'
#' @param left Left elements.
#' @param right Right elements.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerTableItem <- function(left = NULL, right = NULL) {
  shiny::tags$tr(
    shiny::tags$td(left),
    shiny::tags$td(class = "text-right", right)
  )
}
