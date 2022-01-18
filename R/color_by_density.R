#' Color Images by density
#'
#' @description  I think this code is adapted from a blog post by
#' Will R Chase. This takes an image and maps new colors by density
#' then saves the image with the new name.
#' This uses EBImage from Bioconductor.
#'
#' @param new_name the new name for the file
#' @param image_path the path to the source image
#' @param palette the new palette to apply
#' @param mode A character value specifying target mode for conversion using EBIImage See details
#'
#' @md
#' @details
#' Conversion Modes:
#' + `"rgb"`: Converts a Grayscale image or an array into a Color image, replicating RGB channels.
#' + `"gray" or "grey"` Converts a Color image into a Grayscale image, using uniform 1/3 RGB weights.
#' + `red, green, blue`: Extracts the red, green or blue channel from a Color image. Returns a Grayscale image.
#' + `asred, asgreen, asblue`: Converts a Grayscale image or an array into a Color image of the specified hue.
#' @return nothing
#' @export
color_by_density <- function(new_name, image_path, palette, mode = "grey"){
  img <- EBImage::readImage(image_path)
  conversion <- EBImage::channel(img, mode)

  new_colors <- EBImage::colormap(conversion, palette )
  EBImage::display(new_colors, method = "raster")

  # has it a name?
  # it has
  # Will you give it to me?
  # I will through the veil
  EBImage::writeImage(new_colors, new_name)

}
