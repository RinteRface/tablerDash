library(shiny)
library(tablerDash)

options(shiny.trace = TRUE)

shiny::shinyApp(
  ui = tablerDashPage(
    navbar = tablerDashNav(
      id = "mymenu",
      src = "https://preview.tabler.io/demo/brand/tabler.svg",
      navMenu = tablerNavMenu(
        tablerNavMenuItem(
          tabName = "home",
          icon = "home",
          "Home"
        ),
        tablerNavMenuItem(
          tabName = "test",
          icon = "box",
          "Test"
        )
      )
    ),
    footer = tablerDashFooter(
      copyrights = "@David Granjon, 2018"
    ),
    title = "test",
    body = tablerDashBody(
      tablerTabItems(
        tablerTabItem(
          tabName = "home",
          sliderInput(
            "obs",
            "Number of observations:",
            min = 0,
            max = 1000,
            value = 500
          ),
          plotOutput("distPlot")
        ),
        tablerTabItem(
          tabName = "test",
          checkboxGroupInput(
            "variable",
            "Variables to show:",
            c("Cylinders" = "cyl",
              "Transmission" = "am",
              "Gears" = "gear"
            )
          ),
          tableOutput("data")
        )
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
    output$data <- renderTable({
      mtcars[, c("mpg", input$variable), drop = FALSE]
    }, rownames = TRUE)
  }
)
