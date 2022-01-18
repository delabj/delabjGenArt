#' Draw a ngon's edges with points
#'
#' @param points number of particles to use
#' @param n_edges How many edges does the shape have
#' @param r how far from the center of the shape should the edges be drawn
#' @param c_x x coordinate of origin
#' @param c_y y coordinate of origin
#'
#' @export
ngon_edges <- function(
  n_points = 10000,
  n_edges = 4,r = 4,
  cx = 0, cy = 0
  ) {
  points_per_edge = floor(n_points / n_edges)

  corner_pos <- dplyr::tibble(
    angle = seq(0, 2 * pi, length.out = n_edges+1),
    x = r * cos(angle) + cx, y = r * sin(angle) + cy,
    x_end = lead(x, 1), y_end = lead(y, 1)
  ) %>%
    na.omit()

    mapply(make_line, 1:n_edges, MoreArgs = list(
    n_points = points_per_edge,
    x_start = corner_pos$x, y_start = corner_pos$y,
    x_end = corner_pos$x_end, corner_pos$y_end),
    SIMPLIFY = FALSE) |>
      dplyr::bind_rows()
}

#' Interpolate points between two nodes
#'
#' @param n_points how many points are drawn between the nodes?
#' @param x_start starting x
#' @param y_start starting y
#' @param x_end ending x
#' @param y_end ending y
#' @param ... discarded
#'
#' @export
make_line <- function(
  n_points,
  x_start, y_start,
  x_end, y_end,
  ...
){
  dplyr::tibble(
    id = 1:n_points,
    pct_line = id / n_points,
    x = (1-pct_line) * x_start + pct_line * x_end,
    y = (1-pct_line) * y_start + pct_line * y_end
  )
}


