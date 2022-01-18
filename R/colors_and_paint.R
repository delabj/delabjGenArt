#' Generative Palettes
#'
#' @description A collection of palettes to be used in generative work
#'
#' @export
paint_palettes <- list(
  ace = c("#5B3758", "#AC78BA","black", "white", "white", "grey90", "grey50"),
  retro = c("#FCB76D" , "#AC78BA", "#008F9B", "#008F9B", "white", "grey80"),
  skeptic = c("#08090D","#591E2E","#731209","#BF1717","#FBA779"),
  delabj = c("#721121", "#83B692", "#2660A4", "#F19953"),
  b_w = c("black", "grey10", "grey20", "grey30", "grey40", "grey50", "grey60", "grey70", "grey80", "grey90", "white"),
  ogrwc = c("white", "white", "white", "grey80", "grey80", "grey60", "grey60", "#2660A4", "#83B692","#AC78BA","#2660A4", "#83B692","#AC78BA"),
  retrus = c("#46588C", "#57F2C6", "#358C74", "#F2CAA7", "#F27052")
)

#' Select a random palette from a list
#'
#' @description A helper function to select random palettes for systems
#'
#' @param pal_list a named list of palettes
#' @param seed optional, select a seed for consistent results.
#'
#' @return a character vector with hex codes.
#' @export
get_random_pal <- function(
  pal_list = delabjGenArt::paint_palettes,
  seed = NULL){
  seed <- ambient:::random_seed(1, seed)
  set.seed(seed)
  pal <- pal_list[runif(1, min = 1, max = length(pal_list))]
  name <- names(pal)
  usethis::ui_done("Using palette {name}")
  return(pal)
}
