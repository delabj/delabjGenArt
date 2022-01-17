#' A No Frills theme for generative art
#' @param background_fill color of the plot background
#'
#' # return A list with elements to modify a ggplot object
#' @export
theme_canvas <- function(background_fill = "white"){
  ggplot2::theme(legend.position  = "none",
                 plot.background  = ggplot2::element_rect(fill=background_fill, colour=background_fill),
                 panel.background = ggplot2::element_rect(fill=background_fill, colour=background_fill),
                 axis.ticks       = ggplot2::element_blank(),
                 panel.grid       = ggplot2::element_blank(),
                 axis.title       = ggplot2::element_blank(),
                 axis.text        = ggplot2::element_blank(),
  )
}

