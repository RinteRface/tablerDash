# Add an html dependency, without overwriting existing ones
appendDependencies <- function(x, value) {
  if (inherits(value, "html_dependency"))
    value <- list(value)

  old <- attr(x, "html_dependencies", TRUE)

  htmltools::htmlDependencies(x) <- c(old, value)
  x
}

# Add dashboard dependencies to a tag object
addDeps <- function(x) {

  # put all necessary ressources here

  tablerDash_js <- "dashboard.js"
  tablerDash_css <- "dashboard.css"
  init_js <- "init.js"

  require_js <- "require.min.js"
  core_js <- "core.js"

  bootstrap_js <- "bootstrap.bundle.min.js"
  fontawesome_css <- "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/"
  google_fonts <- "https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&subset=latin-ext"

  dashboardDeps <- list(
    #tablerDash
    htmltools::htmlDependency(
      name = "tablerDash",
      version = "0.1.0",
      src = c(file = system.file("tablerDash-0.1.0", package = "tablerDash")),
      script = c(init_js, require_js, tablerDash_js, core_js),
      stylesheet = tablerDash_css
    ),
    # fontawesome
    htmltools::htmlDependency(
      name = "fontawesome",
      version = as.character(utils::packageVersion("tablerDash")),
      src = c(href = fontawesome_css),
      stylesheet = "font-awesome.min.css"
    ),
    # google fonts
    htmltools::htmlDependency(
      name = "googlefonts",
      version = as.character(utils::packageVersion("tablerDash")),
      src = c(href = google_fonts),
      stylesheet = ""
    ),
    # bootstrap deps
    htmltools::htmlDependency(
      name = "bootstrap",
      version = "4.0.0",
      src = c(file = system.file("bootstrap-4.0.0", package = "tablerDash")),
      script = bootstrap_js
    )
  )
  appendDependencies(x, dashboardDeps)
}
