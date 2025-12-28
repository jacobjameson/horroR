#' Horror color scales for ggplot2
#'
#' These functions provide easy-to-use color scales for ggplot2 based on
#' horror movie palettes.
#'
#' @param palette Name of the horror palette to use
#' @param type Either "discrete" or "continuous"
#' @param reverse Logical, whether to reverse the palette order
#' @param ... Additional arguments passed to discrete_scale or scale_*_gradientn
#'
#' @name horror_scales
NULL

#' Generate a horror palette function for ggplot2
#'
#' @param palette Name of the palette
#' @param reverse Logical, reverse the palette?
#' @param type "discrete" or "continuous"
#' @return A function that generates colors
#' @keywords internal
horror_pal <- function(palette = "Suspiria", reverse = FALSE, type = "discrete") {
  function(n) {
    pal <- horroR_palette(palette, n = n, type = type)
    if (reverse) pal <- rev(pal)
    pal
  }
}

#' Discrete color scale for horror palettes
#'
#' @inheritParams horror_scales
#' @param palette Name of the horror palette (e.g., "Suspiria", "TheShining", "blood")
#' @param reverse Logical, reverse the color order? Default FALSE
#' @param ... Additional arguments passed to ggplot2::discrete_scale
#'
#' @return A ggplot2 scale object
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(x = factor(cyl), fill = factor(cyl))) +
#'   geom_bar() +
#'   scale_fill_horror("Suspiria")
#' }
scale_fill_horror <- function(palette = "Suspiria", reverse = FALSE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }
  ggplot2::discrete_scale(
    "fill",
    "horror",
    horror_pal(palette = palette, reverse = reverse, type = "discrete"),
    ...
  )
}

#' @rdname scale_fill_horror
#' @export
scale_color_horror <- function(palette = "Suspiria", reverse = FALSE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }
  ggplot2::discrete_scale(
    "colour",
    "horror",
    horror_pal(palette = palette, reverse = reverse, type = "discrete"),
    ...
  )
}

#' @rdname scale_fill_horror
#' @export
scale_colour_horror <- scale_color_horror

#' Continuous color scale for horror palettes
#'
#' @inheritParams horror_scales
#' @param palette Name of the horror palette
#' @param reverse Logical, reverse the color order?
#' @param ... Additional arguments passed to ggplot2::scale_fill_gradientn
#'
#' @return A ggplot2 scale object
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_horror_c("blood")
#' }
scale_fill_horror_c <- function(palette = "Suspiria", reverse = FALSE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }
  pal <- horroR_palette(palette, n = 256, type = "continuous")
  if (reverse) pal <- rev(pal)
  ggplot2::scale_fill_gradientn(colours = pal, ...)
}

#' @rdname scale_fill_horror_c
#' @export
scale_color_horror_c <- function(palette = "Suspiria", reverse = FALSE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }
  pal <- horroR_palette(palette, n = 256, type = "continuous")
  if (reverse) pal <- rev(pal)
  ggplot2::scale_color_gradientn(colours = pal, ...)
}

#' @rdname scale_fill_horror_c
#' @export
scale_colour_horror_c <- scale_color_horror_c

#' Binned color scale for horror palettes
#'
#' @inheritParams horror_scales
#' @param palette Name of the horror palette
#' @param reverse Logical, reverse the color order?
#' @param n Number of bins
#' @param ... Additional arguments passed to ggplot2::scale_fill_stepsn
#'
#' @return A ggplot2 scale object
#' @export
scale_fill_horror_b <- function(palette = "Suspiria", reverse = FALSE, n = 6, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }
  pal <- horroR_palette(palette, n = n, type = "continuous")
  if (reverse) pal <- rev(pal)
  ggplot2::scale_fill_stepsn(colours = pal, ...)
}

#' @rdname scale_fill_horror_b
#' @export
scale_color_horror_b <- function(palette = "Suspiria", reverse = FALSE, n = 6, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }
  pal <- horroR_palette(palette, n = n, type = "continuous")
  if (reverse) pal <- rev(pal)
  ggplot2::scale_color_stepsn(colours = pal, ...)
}

#' @rdname scale_fill_horror_b
#' @export
scale_colour_horror_b <- scale_color_horror_b
