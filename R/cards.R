#' Create a Boostrap 4 card
#'
#' Build a tabler card
#'
#' @param ... Body content
#' @param title Card title. If NULL, the header is not displayed.
#' @param options Card extra header elements.
#' @param footer Card footer. NULL by default. Not displayed if NULL.
#' @param status Card status. NULL by default. See \url{https://preview.tabler.io/docs/colors.html} for valid statuses.
#' @param statusSide Status side: "top" or "left".
#' @param collapsible Whether the card is collapsible. TRUE by default.
#' @param collapsed Whether to collapse the card at start. FALSE by default.
#' @param closable Whether the card is closable. TRUE by default.
#' @param zoomable Whether the card is zoomable. TRUE by default.
#' @param width Card width. 6 by default. See Bootstrap grid system. If NULL, the card is
#' full width.
#' @param overflow Whether to set up a x and y overflow. FALSE by default.
#' Useful in case the card contains large tables.
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
                       zoomable = TRUE, width = 6, overflow = FALSE) {

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
    style =  if (overflow) "max-height: 500px; overflow-y: auto;" else NULL,
    if (!is.null(status)) shiny::tags$div(class = statusCl),
    # header
    if (!is.null(title)) {
      shiny::tags$div(
        class = "card-header",
        shiny::tags$h3(class = "card-title", title),

        # card toolbox and other elements such as buttons, ...
        shiny::tags$div(
          class = "card-options",
          if (!is.null(options)) {
            lapply(options, shiny::tagAppendAttributes, class = "mx-1")
          },
          if (collapsible) {
            shiny::tags$a(
              href = "#",
              class = "card-options-collapse",
              `data-toggle` = "card-collapse",
              tablerIcon(name = "chevron-up", lib = "feather")
            )
          },
          if (zoomable) {
            if (closable) {
              shiny::tags$a(
                href = "#",
                class = "card-options-fullscreen",
                `data-toggle` = "card-fullscreen",
                tablerIcon(name = "maximize", lib = "feather")
              )
            }
          },
          if (closable) {
            shiny::tags$a(
              href = "#",
              class = "card-options-remove",
              `data-toggle` = "card-remove",
              tablerIcon(name = "x", lib = "feather")
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
              tablerIcon(name = "chevron-up", lib = "feather")
            } else {
              tablerIcon(name = "chevron-down", lib = "feather")
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
#' @param status Card status. See \url{https://preview.tabler.io/docs/colors.html}.
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
          tablerIcon(name = icon, lib = "feather")
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




#' Create a Boostrap 4 media card
#'
#' Build a tabler media card
#'
#' @param ... Any other elements.
#' @param title Title.
#' @param date Date.
#' @param href External link.
#' @param src Image url.
#' @param avatarUrl Avatar image.
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
#'      tablerMediaCard(
#'       title = "Media Card",
#'       date = "Today",
#'       href = "https://www.google.com",
#'       src = "https://preview.tabler.io/demo/photos/matt-barrett-339981-500.jpg",
#'       avatarUrl = "https://image.flaticon.com/icons/svg/145/145842.svg",
#'       width = 6
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
tablerMediaCard <- function(..., title = NULL, date = NULL, href = NULL,
                            src = NULL, avatarUrl = NULL, width = 4) {

  shiny::column(
    width = width,
    shiny::tags$div(
      class = "card p-3",
      # image
      shiny::tags$a(
        href = if (!is.null(href)) href else "javascript:void(0)",
        class = "mb-3",
        shiny::img(src = src, class = "rounded")
      ),
      # content
      shiny::tags$div(
        class = "d-flex align-items-center px-2",
        shiny::tagAppendAttributes(
          tablerAvatar(
            url = avatarUrl,
            size = "md"
          ),
          class = "mr-3"
        ),
        shiny::tags$div(
          shiny::tags$div(title),
          htmltools::tags$small(class = "d-block text-muted", date)
        ),
        # other elements
        shiny::tags$div(class = "ml-auto text-muted", ...)
      )
    )
  )

}





#' Create a Boostrap 4 blog card
#'
#' Build a tabler blog card
#'
#' @inheritParams tablerMediaCard
#' @param author Blog post author.
#' @param horizontal Whether the card is horizontally displayed. FALSE by default.
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
#'      tablerBlogCard(
#'       title = "Blog Card",
#'       author = "David",
#'       date = "Today",
#'       href = "https://www.google.com",
#'       src = "https://preview.tabler.io/demo/photos/matt-barrett-339981-500.jpg",
#'       avatarUrl = "https://image.flaticon.com/icons/svg/145/145842.svg",
#'       width = 6,
#'       "Look, my liege! The Knights Who Say Ni
#'       demand a sacrifice! …Are you suggesting
#'       that coconuts migr..."
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
tablerBlogCard <- function(..., title = NULL, author = NULL, date = NULL, href = NULL,
                           src = NULL, avatarUrl = NULL, width = 4, horizontal = FALSE) {

  cardCl <- "card"
  if (horizontal) cardCl <- paste0(cardCl, " card-aside")

  shiny::column(
    width = width,
    shiny::tags$div(
      class = cardCl,
      if (!is.null(src)) {
        if (!horizontal) {
          shiny::tags$a(
            href = href,
            target = "_blank",
            shiny::tags$img(
              class = "card-img-top",
              src = src
            )
          )
        } else {
          shiny::tags$a(
            href = href,
            target = "_blank",
            class = "card-aside-column",
            style = paste0("background-image: url(\"", src, "\")")
          )
        }
      },
      # body
      shiny::tags$div(
        class = "card-body d-flex flex-column",
        shiny::h4(shiny::a(href = "#", title)),
        shiny::tags$div(class = "text-muted", ...),
        shiny::tags$div(
          class = "d-flex align-items-center pt-5 mt-auto",
          shiny::tags$div(
            class = "d-flex align-items-center px-2",
            if (!is.null(avatarUrl)) {
              shiny::tagAppendAttributes(
                tablerAvatar(
                  url = avatarUrl,
                  size = "md"
                ),
                class = "mr-3"
              )
            },
            shiny::tags$div(
              shiny::tags$div(author),
              htmltools::tags$small(class = "d-block text-muted", date)
            )
          )
        )
      )
    )
  )
}




#' Create a Boostrap 4 profile card
#'
#' Build a tabler profile card
#'
#' @param title Profile title.
#' @param subtitle Card subtitle.
#' @param background Card background url or path.
#' @param src User profile image.
#' @param socials Slot for \link{tablerSocialLinks} and \link{tablerSocialLink}.
#' @param width Card width. 4 by default.
#'
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
#'      tablerProfileCard(
#'       title = "Peter Richards",
#'       subtitle = "Big belly rude boy, million
#'       dollar hustler. Unemployed.",
#'       background = "https://preview.tabler.io/demo/photos/ilnur-kalimullin-218996-500.jpg",
#'       src = "https://preview.tabler.io/demo/faces/male/16.jpg",
#'       tablerSocialLinks(
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
tablerProfileCard <- function(title = NULL, subtitle = NULL, background = NULL,
                              src = NULL, socials = NULL, width = 4) {

  shiny::column(
    width = width,
    shiny::tags$div(
      class = "card card-profile",
      # header
      shiny::tags$div(
        class = "card-header",
        style = paste0("background-image: url(\"", background, "\")")
      ),
      # body
      shiny::tags$div(
        class = "card-body text-center",
        shiny::img(src = src, class = "card-profile-img"),
        shiny::h3(title),
        shiny::p(class = "mb-4", subtitle),
        socials
      )
    )
  )
}
