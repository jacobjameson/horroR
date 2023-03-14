#' Complete list of palettes
#'
#' Use \code{\link{horroR_palette}} to construct palettes of desired length.
#'
#' @export
horroR_palettes <- list(
  Suspiria = c("#130f2c", "#c68ecc", "#393acc", "#63a3e9", "#662a4b", "#ad2e5b"),
  Coraline = c("#DB5A6B", "#F0A787", "#FEEA9E", "#F2CF5B", "#C1D37F", "#8AA283", "#F4D4C4", "#4D3A3A", "#BD4A7D", "#F04923"),
  Scream = c("#000000", "#D7BFA3", "#E1C8A9", "#EBD2B0", "#F5DCB7", "#FFC6A0", "#FFB391", "#FFA17B", "#FF8D64", "#FF793E"),
  NightmareOnElmStreet = c("#C9251E", "#B75F31", "#283D3B", "#000000", "#FFFFFF", "#F0A21A", "#B56D22", "#A0D8EF", "#EEE1B3", "#D45D4B"),
  TheShining = c("#E13D29", "#2E2928", "#9E978E", "#E3DCC1", "#D65108", "#2B4E72", "#DFBBB1", "#8B6145", "#7D202E", "#000000"),
  TheNeonDemon = c("#1f1b61", '#da367a', '#5335e3', '#872562', '#ead6d6', '#7c151b', '#96a4f0'),
  Midsommar = c("#65a5c1", '#825545', '#e6cb3d', '#b34d63', '#aed5ae'),
  silenceofthelambs = c('#320f0d', '#cbd3d8', '#c51216', '#d9943f')
  )

#' A Horror movie palette generator
#'
#' These are a handful of color palettes from Horror movies.
#'
#' @param n Number of colors desired. Unfortunately most palettes now only
#'   have 4 or 5 colors. But hopefully we'll add more palettes soon.
#' @param name Name of desired palette. Choices are:
#'   \code{Suspiria}, \code{Midsommar},  \code{TheNeonDemon}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' horroR_palette("Suspiria")
#' horroR_palette("Midsommar")
#' horroR_palette("TheNeonDemon")
#' horroR_palette("TheNeonDemon", 3)
#'
#' # If you need more colors than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- horroR_palette(21, name = "Suspiria", type = "continuous")
#' image(volcano, col = pal)
horroR_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- horroR_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

#' heatmap
#'
#' A heatmap example
"heatmap"
