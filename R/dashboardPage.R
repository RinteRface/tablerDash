#' Create a Boostrap 4 dashboard page
#'
#' Build a tabler dashboard page
#'
#' @param navbar Slot for \link{tablerDashNav}.
#' @param body Slot for \link{tablerDashBody}.
#' @param footer Slot for \link{tablerDashFooter}.
#' @param title App title.
#' @param enable_preloader Whether to enable a page loader. FALSE by default.
#' @param loading_duration Loader duration in seconds. 2s by default.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  library(tablerDash)
#'
#'  shiny::shinyApp(
#'    ui = tablerDashPage(
#'     navbar = tablerDashNav(),
#'     footer = tablerDashFooter(),
#'     title = "test",
#'     body = tablerDashBody()
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerDashPage <- function(navbar = NULL, body = NULL,
                        footer = NULL, title = NULL,
                        enable_preloader = FALSE,
                        loading_duration = 2){


  # hide body and footer
  bodyContent <- shiny::tags$div(
    class = "page-main",
    style = if (enable_preloader) "visibility: hidden;" else NULL,
    navbar,
    body
  )

  footer <- shiny::tagAppendAttributes(footer, class = "footer")

  footer <- if (enable_preloader) {
    shiny::tagAppendAttributes(footer, style = "visibility: hidden;")
  }

  # preloader
  preloader <- shiny::tags$div(
    class = "dimmer active",
    shiny::tags$div(
      class = "loader",
      style = "
        position: fixed;
        z-index: 999;
        height: 2em;
        width: 2em;
        overflow: visible;
        margin: auto;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;",
      shiny::tags$div(
        class = "dimmer-content"
      )
    )
  )

  shiny::tags$html(
    # Head
    shiny::tags$head(
        shiny::tags$meta(charset="UTF-8"),
        shiny::tags$meta(
          name = "viewport",
          content = "
          width=device-width,
          user-scalable=no,
          initial-scale=1.0,
          maximum-scale=1.0,
          minimum-scale=1.0"
        ),
        shiny::tags$meta(`http-equiv` = "X-UA-Compatible", content = "ie=edge"),
        shiny::tags$meta(`http-equiv` = "Content-Language", content = "en"),
        shiny::tags$meta(name = "msapplication-TileColor", content = "#2d89ef"),
        shiny::tags$meta(name = "theme-color", content = "#4188c9"),
        shiny::tags$meta(name = "apple-mobile-web-app-status-bar-style", content = "black-translucent"),
        shiny::tags$meta(name = "apple-mobile-web-app-capable", content = "yes"),
        shiny::tags$meta(name = "mobile-web-app-capable", content = "yes"),
        shiny::tags$meta(name = "HandheldFriendly", content = "True"),
        shiny::tags$meta(name = "MobileOptimized", content = "320"),
        #<link rel="icon" href="./favicon.ico" type="image/x-icon">
        #<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico">
      shiny::includeCSS(path = "https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&subset=latin-ext"),
      shiny::tags$title(title)
    ),
    # Body
    addDeps(
      shiny::tags$body(
        class = NA,
        # set up a time-out for the preloader
        # The body content disappears first,
        # then 2s after, the preloader disappears and
        # the body content is shown
        onload = if (enable_preloader) {
          duration <- loading_duration * 1000
          paste0(
            "$(document).ready(function() {
              setTimeout(function(){
                $('.dimmer.active').remove();
                $('.page-main').css('visibility', 'visible');
                $('.footer').css('visibility', 'visible');
                }, ", duration, ");
            });
            "
          )
        },
        shiny::tags$div(
          class = "page",
          if (enable_preloader) preloader,
          bodyContent,
          footer
        )
      )
    )
  )
}
