#' Create a Boostrap 4 icon
#'
#' Build a tabler icon
#'
#' @param name Name of icon. See \url{https://preview.tabler.io/icons.html} for all valid icons.
#' @param lib Icon library ("feather", "font-awesome", "payment").
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
tablerIcon <- function(name, lib = c("feather", "font-awesome", "payment")) {
 lib <- match.arg(lib)
 iconCl <- switch(
   lib,
   "feather" = "fe fe-",
   "font-awesome" = "fa fa-",
   "payment" = "payment payment-"
 )
 shiny::tags$i(class = paste0(iconCl, name))
}
