
# tablerDash <img src="https://rinterface.com/inst/images/tablerDash.svg" width=200 align="right" />

<!-- badges: start -->

[![R build
status](https://github.com/RinteRface/tablerDash/workflows/R-CMD-check/badge.svg)](https://github.com/RinteRface/tablerDash/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/tablerDash)](https://cran.r-project.org/package=tablerDash)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-ff69b4.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![cranlogs](https://cranlogs.r-pkg.org/badges/tablerDash)](https://cran.r-project.org/package=tablerDash)
[![total](https://cranlogs.r-pkg.org/badges/grand-total/tablerDash)](https://www.rpackages.io/package/tablerDash)
<!-- badges: end -->

> Tabler dashboard template for shiny with Bootstrap 4

See <https://tabler.io> for the original template.

## Installation

This package is on CRAN:

``` r
# latest devel version
devtools::install_github("RinteRface/tablerDash")
# CRAN version
install.packages("tablerDash")
```

## Demo

<div class="card bslib-card bslib-mb-spacing html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="bslib-card-5440" style="margin: 0 auto; float: none;">
<div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
<iframe class="html-fill-item" src="https://shinylive.io/r/app/#code=NobwRAdghgtgpmAXGKAHVA6ASmANGAYwHsIAXOMpMAdzgCMAnRRASwgGdSoAbbgCgA6YLnW5wGAESjsAFkNwACBnFRF2CgLwKCgsDNKlU7RAHoTDNuQYAzKATgYA5i1IyArnQwsi5y+Nv2ALTU0jCBBAxQECbyCkL6hsZmyqoYDMGhGEQMjkIAlHkCEEXcLIxQDACefLJslYUQpeVVfCJiktIyDU2RLXAEMhWk7AAsDN1lvdW1EJUA6iwAJo5wwxPN1TBQjhYG4yWTFdWoPPAMqBSObmzsDUVFAMQKi1Bc6tbcRNQA4txFAG79UjZdQAHkCCjgAA8ThBFk4LIs+FDNApAgBmRDoxSVVEYrENGBuBTghQARgBQJBABJ2CjSYCCMCGOxqZVKUyaexcaSiQoAFQKPhktEKRnM1lQgB6ACY8gKxVSWWzReKaVCORLqcRPgwSRDPo4yQAGPgMNwQFjWPgQBhfPhqll5RRkl3Ggr3CBPAgVRbsIofL4AYV9+oUbXEIYYSKKCnDLjEqKEADFPj9uAog4MGKR5LHtJ92FBRHBUcmAIIAGQAygBRXD5gBeRCIWxLqIAKlgAKr1-NEVCkbwcVFcRyVlicQQQONxiMMcv-V4VGpcUhudRaISleCxNwMDNbvQGIymEyoZT-FhwagYedeHycV4sAgmKBLrgskzGn8wDAAK1QXIwAaONnXzagllcVEyRlBsZ0hAYhlGBgAHk3EMDDdEDdN8nguNrBbKxR2LdoO22G1YFLI86GubhFliKBFkWEgkzAE52HYNhgMUJiWIgIMiF1Nj2DcAh7E4-IijuCALyIawWDEKNFjDecAAU7QUpTfWnONIMWaCtFg-D41IRMjwkSoohnWt2B9bgoDzBDRLoIczOouIwAAWX6QZLXshRq0qTg4BgdRawgZwIDgcQnLjdgGAINiElPMwLzgK8bzvUjxAfEwnyHV9UBkIhgXYEwFOgCAJMCDdAhY3gKnYQIokWQI6BcYgbnCfdlGqypAhgEg4EqACgLi8McoYasiAIFgeAnCAAGt2F02d5xmuaFrYJa1tnBRoHgNiAnoFslom-aZGUaxkpPJITGoR6MBOugzowYgYAu2cX1Yo8XrOoR8zAky5ymzb5u4RbdqB2dDo8oRSEggxYrwGG4yuuAbqPFL7se29EZcKx3tbL64x+mcjwJ5GGEBhCwPzBoZKeNBUCKGZKmYdny3QNbrhIksOlkNTtjgPaDvfOgKn59opFkAA5d8xbJlSjxgSp4AgNxSYUBKkuxu6z0iW9nFcDwN3EYgyAoUhiZgEx53tqaTEWDL8sS-K1xfExDSIDB2H+Hi0fF-4fM16XxAVkOKDcJX1qmyPQ7cABJcgYFj-aRAVo6jwACVbOBtf28nkvzwvZyEPPdzAIPgZryaBYT6OU9C9O47oLP4bADs4E4MuycttjXo1VG6f28uu573Nq9H-bQLH8CZ-rmW7VQFjqAgVv5wkFe14gZu07rucE07-fyVMsQ+4UDGsc8lKz0cFtHDEW3L4Kjc2JeSKUZBse4xecg2IQC+JfIQHYZCTgUBA1wpYFIslIM8HeXwZwuFCrTX+tdF6gwFtvAcu996t3imud+R4QgMEtJFEBXdwHqCgTIUs7B+gkBUosRB69IGp0vv-TulRJ7iBeOyae6CFALyEVvVhe9U4EPPifVOCh0TSMoWAiBtDSyuBYNGBBuCkHsNQYI9Bc9Z4wxEbOQipVxDh0FjIZMRFxCx3nEnS2lFs6eS2JPO0sQmhsROOra2eEg72McXDNiWwQqJV9B4soXioA+LIH4xexBUCVAsI4fQm5PIAAEpBXhUt8SIEB-wkEUDKY0MoRhoNnMYo+7k2Jb06F9V6ixcRaFqbIAAQkQRp04g4DBbAw6spQXbTSWmwXQXkOniGKCBH+WCyLFn3qtOu85yJ0HwYfeuHc2KVwLiPIRBFuDXEWFge0ay4w6jcDADeJzZz6UMgoEY0zdlyS0nAZSDyhGazOC+JOsksJXKLj80gScVaeWBFwbg1ZmQi0vr-BydA4CHk8hFYinBsgi20GgOwLgBFvN2UufZHkTQ-kqbsuM1x0KYVILoNghEpKYPnji-aZyLlSP2jcmQqIAAcDKx44WUlcgx+juUfAOUc6gLLtBCXOZculv82Wcu5RnKaylxX7TfmkoQF4WBbCqNCsearqxLE7sCVmOySVjzlUZOCfy25kS1fCtgotrWKoFh2O1pRoqrJlWaty5lPKnwpKas16C1VsR2DFSZCrdlcMAcAvRQbZ6Rt-kst1DrPXxvQT6mRoUFAyl1UIkNWg5bdkrJWRN6Do1Hh4aE-heb0FCErNkbNLAjDnOeEJbIOsXAKCoqQMtpySAMKZKsfc3bFjNsnC+bikJSg23Kem+mXrf4CpJcuwVVymXSvTRau5ZaNprmVU6sUPA3AeRGNiQ9ma2LWN4F8cQ-pA3xtIH1YFgQTR9oUNu2C1rV1LrWT+4ROKllzMkWszOVE2Ld17g+pNSqdJXMvUeNSnxhi6tQMh8lqBflgDHZwJDpU4lBoLZ5alRBdX6sNWxMQ1gp6Rs-VaxdChTHEWadsCcU5rUbpVdcqC7LLXvp4CwRwFNPL2CtjTaDZr2ADPEN8zDlLD1xiEEQOg9732KbAHLc5cK9TyQUMphhDAPzDmMLW-aMA2ComNGphQWwURGR-FZhTR78WogAKw-kPf+39DGvMAdA7B6M4qEOeWWWIVTVyGFiCZLJ35DH1NLgsDlWtQgABqFR5olnUMCHWJVqCIFrT0l8PdUQ6jhqtC4kVrgcGJSSyLQI4DAtK1Rcrlwqu3DLUSbgQ40MeS7L2flkaIwYaw--RyUyrl0cjUQQENg0ydh7LWP93L5wHoY5Nq5vlkJjGG-JsAjgoBuBWLEOhgn9BsXRD+VAw8avBukwwGL8m4ueX24duAaW-gSaEUIb4B2VgKHeye-Ln30HmeE45p7tmYI-jLXik9bnjT8r-XXVdAq57GIMzN1E1gLRMmHHwNgcnFBEAwnJ+UIAYbE4pdSHDpA8PwNJM+8QdO+Dk8XtQylZDshpwJxhak+mPSjwAL4Csp3J6ny4wyM4YKF0WrPf4VauDcYAigeekGpAljLYhFAsIHGWKsdYAC6MNBeKDtOvZr83ewyX2qL3nOFfiS4oIM2sSEcwoRZ0HR06gACkAA+b3dc4AAH1XfDGRPKP3Ae6XB5wkHp+fBKiKDpEnxPErdQR-94HoPV5RI8CD1sVAUjQeWcUJDoyigniGnJAjr1Y6NZcV+juhQTw7MKCswoJp5Ik+t+xDrTvZSvWyC+Hrms9Zm9X0NWstgWAoh-a0KUdjDGdQdq0DoAA5A8dEZJ0QADYACcrm1+KA3yMVzAB2VzdARhH4UBvs-Iw+Jkhvxv4siw99wD38-h4cBjTWHRNYDlI-JzfaDfawMA6wOgawL-awGKY0PfY0aAl4OAHfJ-Y-B4awEYHfRYM9L-RYM-C7GUM-L-KAdzEpHfNfXzf9DPKPIRYPKEIPKAKEScKRdgNDFwRaDyBfSlIfagEfOsKghQSPLPSoBgpghZQfNg0gDg1ELgmoXLPg2sKg43GSCnEnXnEjR3OEcQbsJOD3ReexCAQiVbIRdbOlWHDyDicgU0VXakUFHgCFVFFYRQb7VpAjYNIhdVMAUScSHucLOlYuI8UbSWBhMuF2OyCwQcYcCDUqHgQKSFP7EME4OaUgARIOAVYXT0G3NQtXF7P7BnJ3cQF3bMYYMYPQ3+YPUPVaagrPXI0WaQDAD5cQF8fHAFakWo97Z0TyAPECZQ-MQXaSIoMAQXA3IAA&amp;h=0" height="700" width="100%" style="border: 1px solid rgba(0,0,0,0.175); border-radius: .375rem;" allowfullscreen="" allow="autoplay" data-external="1"></iframe>
</div>
<bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
<template>Expand</template>
<button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
</bslib-tooltip>
<script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
</div>
<p class="text-center mt-2">
<a 
class="btn btn-primary" 
data-bs-toggle="collapse" 
href="#demo-code" 
role="button" 
aria-expanded="false" 
aria-controls="demo-code"> Toggle code </a>
</p>

<div id="demo-code" class="collapse">

``` r
library(shiny)
library(tablerDash)
library(echarts4r)
library(shinyWidgets)
library(magrittr)
library(palmerpenguins)


# datas flowGl
vectors <- expand.grid(x = -3:3, y = -3:3)
mu <- 1
vectors$sx <- vectors$y
vectors$sy <- mu * (1 - vectors$x^2) * vectors$y - vectors$x
vectors$color <- log10(runif(nrow(vectors), 1, 10))

# cards
flowCard <- tablerCard(
  title = "FlowGl Chart",
  closable = FALSE,
  zoomable = TRUE,
  options = tagList(
    tablerAvatar(status = "lime", url = "https://preview.tabler.io/static/avatars/000m.jpg")
  ),
  width = 12,
  echarts4rOutput("flowGl"),
  footer = tablerTag(name = "build", addon = "passing", addonColor = "success")
)

profileCard <- tablerProfileCard(
  width = 12,
  title = "Dyann Escala",
  subtitle = "Mechanical Systems Engineer",
  src = "https://preview.tabler.io/static/photos/finances-us-dollars-and-bitcoins-currency-money.jpg",
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

# app
shiny::shinyApp(
  ui = tablerDashPage(
    navbar = tablerDashNav(
      id = "mymenu",
      src = "https://raw.githubusercontent.com/tabler/tabler/dev/src/static/logo.svg",
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
          href = "https://google.com",
          status = "danger",
          date = "now",
          "This is the first dropdown item"
        ),
        tablerDropdownItem(
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
      copyrights = "@David Granjon, 2024"
    ),
    title = "tablerDash",
    body = tablerDashBody(

      chooseSliderSkin("Modern"),
      tablerTabItems(
        tablerTabItem(
          tabName = "Home",
          fluidRow(
            column(
              width = 4,
              profileCard,
              numericInput(
                inputId = "totalStorage",
                label = "Enter storage capacity",
                value = 1000),
              uiOutput("info")
            ),
            column(
              width = 8,
              flowCard
            )
          ),
          fluidRow(
            column(
              width = 8,
              tablerCard(
                status = "primary",
                statusSide = "top",
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
              )
            ),
            column(
              width = 4,
              tablerStatCard(
                value = 43,
                title = "Followers",
                trend = -10,
                width = 12
              )
            )
          )
        ),
        tablerTabItem(
          tabName = "Test",
          tablerCard(
            title = "Plots",
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
          ),
          tablerCard(
            title = "Tables",
            selectInput(
              "variable",
              "Variables to show:",
              choices = colnames(penguins),
              selected = colnames(penguins),
              multiple = TRUE
            ),
            tableOutput("data"),
            width = 12,
            overflow = TRUE
          ),
          tablerCard(
            width = 12,
            echarts4rOutput("gauge", height = "300px"),
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
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
    output$data <- renderTable({
      penguins[, input$variable, drop = FALSE]
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

    output$gauge <- renderEcharts4r({
      e_charts() %>%
        e_gauge(as.numeric(input$gaugeVal), "%")
    })
  }
)
```

</div>

<div class="row">

<div class="card">

<a href="https://community.rstudio.com/t/shiny-contest-submission-gotta-catch-em-almost-all/25284" target="_blank"><img src="https://community.rstudio.com/uploads/default/optimized/2X/6/626cbb941e2c3dfe543abde05f7e4097186811c6_2_690x431.png"></a>

</div>

</div>

<br>

<div class="row">

<div class="card">

<a href="https://community.rstudio.com/t/shiny-contest-submission-gotta-catch-em-almost-all/25284" target="_blank"><img src="https://community.rstudio.com/uploads/default/optimized/2X/3/33061a47390f6fa1515302d7f05e05c1b6f3e458_2_690x431.jpeg"></a>

</div>

</div>

<br>

## Issues

Issues are listed
[here](https://github.com/RinteRface/tablerDash/issues).

## Code of Conduct

Please note that the tablerDash project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
