library(shiny)
library(tablerDash)
library(shinyEffects)
library(echarts4r)
library(shinyWidgets)


# datas flowGl
vectors <- expand.grid(x = -3:3, y = -3:3)
mu <- 1
vectors$sx <- vectors$y
vectors$sy <- mu * (1 - vectors$x^2) * vectors$y - vectors$x
vectors$color <- log10(runif(nrow(vectors), 1, 10))

# calendar plot
dates <- seq.Date(as.Date("2018-01-01"), as.Date("2018-12-31"), by = "day")
values <- rnorm(length(dates), 20, 6)

year <- data.frame(date = dates, values = values)

# cards
flowCard <- tablerCard(
  title = "FlowGl Chart",
  closable = FALSE,
  zoomable = FALSE,
  options = tagList(
    tablerAvatar(status = "lime", url = "https://john-coene.com/img/profile.png"),
    tablerTag(name = "build", addon = "passing", addonColor = "success")
  ),
  width = 12,
  echarts4rOutput("flowGl")
)

profileCard <- tablerProfileCard(
  width = 12,
  title = "Peter Richards",
  subtitle = "Big belly rude boy, million
      dollar hustler. Unemployed.",
  background = "https://preview.tabler.io/demo/photos/ilnur-kalimullin-218996-500.jpg",
  src = "https://preview.tabler.io/demo/faces/male/16.jpg",
  tablerSocialLinks(
    tablerSocialLink(
      name = "facebook",
      href = "https://www.facebook.com",
      icon = "facebook"
    ),
    tablerSocialLink(
      name = "twitter",
      href = "https://www.twitter.com",
      icon = "twitter"
    )
  )
)


calendarCard <- tablerBlogCard(
  horizontal = TRUE,
  width = 12,
  echarts4rOutput("calendar")
)


# app
shiny::shinyApp(
  ui = tablerDashPage(
    navbar = tablerDashNav(
      id = "mymenu",
      src = "https://preview.tabler.io/demo/brand/tabler.svg",
      navMenu = tablerNavMenu(
        tablerNavMenuItem(
          tabName = "Home",
          icon = "home",
          "Home"
        ),
        tablerNavMenuItem(
          tabName = "Test",
          icon = "box",
          "Test"
        )
      ),
      tablerDropdown(
        tablerDropdownItem(
          title = "Item 1 title",
          href = "http://google.com",
          url = "https://image.flaticon.com/icons/svg/1301/1301804.svg",
          status = "danger",
          date = "now",
          "This is the first dropdown item"
        ),
        tablerDropdownItem(
          url = "https://image.flaticon.com/icons/svg/1301/1301809.svg",
          status = "warning",
          "This is the second dropdown item",
          date = "yesterday"
        ),
        tablerDropdownItem(
          title = "Item 3 title",
          "This is the third dropdown item"
        )
      )
    ),
    footer = tablerDashFooter(
      tablerIcon(name = "maestro", lib = "payment"),
      tablerIcon(name = "mastercard", lib = "payment"),
      copyrights = "@David Granjon, 2019"
    ),
    title = "tablerDash",
    body = tablerDashBody(

      setZoom(class = "card"),
      chooseSliderSkin("Nice"),
      tablerTabItems(
        tablerTabItem(
          tabName = "Home",
          fluidRow(
            column(
              width = 3,
              profileCard,
              tablerStatCard(
                value = 43,
                title = "Followers",
                trend = -10,
                width = 12
              )
            ),
            column(
              width = 6,
              flowCard
            ),
            column(
              width = 3,
              tablerCard(
                width = 12,
                tablerTimeline(
                  tablerTimelineItem(
                    title = "Item 1",
                    status = "green",
                    date = "now"
                  ),
                  tablerTimelineItem(
                    title = "Item 2",
                    status = NULL,
                    date = "yesterday",
                    "Lorem ipsum dolor sit amet,
                consectetur adipisicing elit."
                  )
                )
              ),
              tablerInfoCard(
                value = "132 sales",
                status = "danger",
                icon = "dollar-sign",
                description = "12 waiting payments",
                width = 12
              ),
              numericInput(
                inputId = "totalStorage",
                label = "Enter storage capacity",
                value = 1000),
              uiOutput("info")
            )
          )
        ),
        tablerTabItem(
          tabName = "Test",
          fluidRow(
            column(
              width = 6,
              tablerCard(
                title = "Plots",
                zoomable = FALSE,
                closable = FALSE,
                options = tagList(
                  switchInput(
                    inputId = "enable_distPlot",
                    label = "Plot?",
                    value = TRUE,
                    onStatus = "success",
                    offStatus = "danger"
                  )
                ),
                plotOutput("distPlot"),
                status = "info",
                statusSide = "left",
                width = 12,
                footer = tagList(
                  column(
                    width = 12,
                    align = "center",
                    sliderInput(
                      "obs",
                      "Number of observations:",
                      min = 0,
                      max = 1000,
                      value = 500
                    )
                  )
                )
              )
            ),
            column(
              width = 6,
              tablerCard(
                title = "Tables",
                checkboxGroupInput(
                  "variable",
                  "Variables to show:",
                  c("Cylinders" = "cyl",
                    "Transmission" = "am",
                    "Gears" = "gear"
                  ),
                  inline = TRUE
                ),
                tableOutput("data"),
                width = 12,
                overflow = TRUE
              ),
              fluidRow(
                column(
                  width = 6,
                  echarts4rOutput("gauge", height = "300px")
                ),
                column(
                  width = 6,
                  sliderInput(
                    "gaugeVal",
                    "Gauge Value:",
                    min = 0,
                    max = 100,
                    value = 50
                  )
                )
              )
            )
          ),
          fluidRow(calendarCard)
        )
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      if (input$enable_distPlot) hist(rnorm(input$obs))
    })
    output$data <- renderTable({
      mtcars[, c("mpg", input$variable), drop = FALSE]
    }, rownames = TRUE)

    output$flowGl <- renderEcharts4r({
      vectors %>%
        e_charts(x) %>%
        e_flow_gl(y, sx, sy, color) %>%
        e_visual_map(
          min = 0, max = 1, # log 10
          dimension = 4, # x = 0, y = 1, sx = 3, sy = 4
          show = FALSE, # hide
          inRange = list(
            color = c('#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8',
                      '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026')
          )
        ) %>%
        e_x_axis(
          splitLine = list(show = FALSE)
        ) %>%
        e_y_axis(
          splitLine = list(show = FALSE)
        )
    })


    output$info <- renderUI({
      tablerInfoCard(
        width = 12,
        value = paste0(input$totalStorage, "GB"),
        status = "success",
        icon = "database",
        description = "Total Storage Capacity"
      )
    })


    output$calendar <- renderEcharts4r({
      year %>%
        e_charts(date) %>%
        e_calendar(range = "2018") %>%
        e_heatmap(values, coord_system = "calendar") %>%
        e_visual_map(max = 30)
    })


    output$gauge <- renderEcharts4r({
      e_charts() %>%
        e_gauge(as.numeric(input$gaugeVal), "%")
    })

  }
)
