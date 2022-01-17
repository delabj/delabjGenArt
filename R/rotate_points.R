#' Rotate points about
#'
#' @description take a set of and rotate it in degrees
#'
#' @param data a data.frame
#' @param x column with x coordinates
#' @param y column with y coordinates
#' @param deg the degree to rotate the points
#' @param cx the x coordinate to rotate around
#' @param cy the y coordinate to rotate around
#'
#' @return a data.frame
#'
#' @export

rotate_points <- function(data, x,y, deg = 0, cx=0, cy=0){
  rad <- deg*pi/180
  data %>%
    dplyr::mutate(
      new_x = cx + ({{x}} - cx) * cos(rad) - ({{y}} - cy) * sin(rad),
      new_y = cy + ({{y}} - cy) * cos(rad) + ({{x}} - cx) * sin(rad)
    ) %>%
    select(
      {{x}} := new_x,
      {{y}} := new_y
    )
}




