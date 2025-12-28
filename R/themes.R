#' Horror-themed ggplot2 themes
#'
#' A collection of ggplot2 themes inspired by horror movies and aesthetics.
#' These themes transform your plots into creepy, atmospheric visualizations.
#'
#' @param base_size Base font size (default 12)
#' @param base_family Base font family
#'
#' @name horror_themes
NULL

#' Base Horror Theme
#'
#' A dark, atmospheric base theme for horror-styled plots.
#' Features a black background with blood-red accents.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point(color = "#8b0000", size = 3) +
#'   theme_horror()
#' }
theme_horror <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      # Background
      plot.background = ggplot2::element_rect(fill = "#0a0a0a", color = NA),
      panel.background = ggplot2::element_rect(fill = "#0f0f0f", color = NA),
      panel.border = ggplot2::element_rect(color = "#1a1a1a", fill = NA, linewidth = 1),

      # Grid
      panel.grid.major = ggplot2::element_line(color = "#1a1a1a", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_line(color = "#151515", linewidth = 0.2),

      # Text
      text = ggplot2::element_text(color = "#c0c0c0"),
      plot.title = ggplot2::element_text(
        color = "#8b0000",
        size = base_size * 1.4,
        face = "bold",
        hjust = 0.5,
        margin = ggplot2::margin(b = 10)
      ),
      plot.subtitle = ggplot2::element_text(
        color = "#666666",
        size = base_size * 0.9,
        hjust = 0.5,
        margin = ggplot2::margin(b = 15)
      ),
      plot.caption = ggplot2::element_text(color = "#444444", size = base_size * 0.7),

      # Axes
      axis.text = ggplot2::element_text(color = "#808080"),
      axis.title = ggplot2::element_text(color = "#a0a0a0", face = "bold"),
      axis.ticks = ggplot2::element_line(color = "#333333"),
      axis.line = ggplot2::element_line(color = "#333333"),

      # Legend
      legend.background = ggplot2::element_rect(fill = "#0f0f0f", color = "#1a1a1a"),
      legend.key = ggplot2::element_rect(fill = "#0f0f0f", color = NA),
      legend.text = ggplot2::element_text(color = "#a0a0a0"),
      legend.title = ggplot2::element_text(color = "#c0c0c0", face = "bold"),

      # Strip (for facets)
      strip.background = ggplot2::element_rect(fill = "#1a0a0a", color = "#333333"),
      strip.text = ggplot2::element_text(color = "#8b0000", face = "bold"),

      # Margins
      plot.margin = ggplot2::margin(15, 15, 15, 15)
    )
}

#' Slasher Theme
#'
#' High contrast theme with blood red and black, inspired by 80s slasher films.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_slasher <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#000000", color = NA),
      panel.background = ggplot2::element_rect(fill = "#0a0000", color = NA),
      panel.border = ggplot2::element_rect(color = "#8b0000", fill = NA, linewidth = 2),
      panel.grid.major = ggplot2::element_line(color = "#1a0000", linewidth = 0.5),
      panel.grid.minor = ggplot2::element_blank(),
      text = ggplot2::element_text(color = "#ff0000"),
      plot.title = ggplot2::element_text(
        color = "#ff0000",
        size = base_size * 1.6,
        face = "bold",
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(color = "#8b0000", hjust = 0.5),
      axis.text = ggplot2::element_text(color = "#b22222"),
      axis.title = ggplot2::element_text(color = "#dc143c", face = "bold"),
      axis.ticks = ggplot2::element_line(color = "#8b0000"),
      axis.line = ggplot2::element_line(color = "#8b0000", linewidth = 1),
      legend.background = ggplot2::element_rect(fill = "#0a0000", color = "#8b0000"),
      legend.key = ggplot2::element_rect(fill = "#0a0000"),
      legend.text = ggplot2::element_text(color = "#ff6666"),
      legend.title = ggplot2::element_text(color = "#ff0000"),
      strip.background = ggplot2::element_rect(fill = "#3d0000", color = "#8b0000"),
      strip.text = ggplot2::element_text(color = "#ff0000", face = "bold"),
      plot.margin = ggplot2::margin(20, 20, 20, 20)
    )
}

#' Supernatural Theme
#'
#' Ethereal, ghostly theme with pale blues and misty grays.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_supernatural <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#0a0a14", color = NA),
      panel.background = ggplot2::element_rect(fill = "#0f0f1a", color = NA),
      panel.border = ggplot2::element_rect(color = "#2a2a4a", fill = NA, linewidth = 1),
      panel.grid.major = ggplot2::element_line(color = "#1a1a2a", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_line(color = "#15151f", linewidth = 0.2),
      text = ggplot2::element_text(color = "#a0a0c0"),
      plot.title = ggplot2::element_text(
        color = "#8888b0",
        size = base_size * 1.4,
        face = "italic",
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(color = "#6666a0", face = "italic", hjust = 0.5),
      axis.text = ggplot2::element_text(color = "#7070a0"),
      axis.title = ggplot2::element_text(color = "#9090b0"),
      axis.ticks = ggplot2::element_line(color = "#3a3a5a"),
      axis.line = ggplot2::element_line(color = "#3a3a5a"),
      legend.background = ggplot2::element_rect(fill = "#0f0f1a", color = "#2a2a4a"),
      legend.key = ggplot2::element_rect(fill = "#0f0f1a"),
      legend.text = ggplot2::element_text(color = "#8080b0"),
      legend.title = ggplot2::element_text(color = "#a0a0c0", face = "italic"),
      strip.background = ggplot2::element_rect(fill = "#1a1a2e", color = "#2a2a4a"),
      strip.text = ggplot2::element_text(color = "#9090c0", face = "italic"),
      plot.margin = ggplot2::margin(15, 15, 15, 15)
    )
}

#' Vintage Horror Theme
#'
#' Old film grain aesthetic with sepia tones, inspired by classic horror.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_vintage <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#1a1510", color = NA),
      panel.background = ggplot2::element_rect(fill = "#201a14", color = NA),
      panel.border = ggplot2::element_rect(color = "#3a3020", fill = NA, linewidth = 1),
      panel.grid.major = ggplot2::element_line(color = "#2a2418", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_line(color = "#241e14", linewidth = 0.2),
      text = ggplot2::element_text(color = "#c4b8a8"),
      plot.title = ggplot2::element_text(
        color = "#d4c4a8",
        size = base_size * 1.3,
        face = "bold",
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(color = "#a09080", hjust = 0.5),
      axis.text = ggplot2::element_text(color = "#8a7a6a"),
      axis.title = ggplot2::element_text(color = "#b4a494"),
      axis.ticks = ggplot2::element_line(color = "#4a3a2a"),
      axis.line = ggplot2::element_line(color = "#4a3a2a"),
      legend.background = ggplot2::element_rect(fill = "#201a14", color = "#3a3020"),
      legend.key = ggplot2::element_rect(fill = "#201a14"),
      legend.text = ggplot2::element_text(color = "#a09080"),
      legend.title = ggplot2::element_text(color = "#c4b4a4"),
      strip.background = ggplot2::element_rect(fill = "#2a2418", color = "#4a3a2a"),
      strip.text = ggplot2::element_text(color = "#c4b4a4"),
      plot.margin = ggplot2::margin(15, 15, 15, 15)
    )
}

#' Neon Demon Theme
#'
#' Vibrant neon colors on dark background, inspired by neon-noir horror.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_neon <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#0a0a14", color = NA),
      panel.background = ggplot2::element_rect(fill = "#0f0f1a", color = NA),
      panel.border = ggplot2::element_rect(color = "#ff00ff", fill = NA, linewidth = 1),
      panel.grid.major = ggplot2::element_line(color = "#1a1a2e", linewidth = 0.4),
      panel.grid.minor = ggplot2::element_blank(),
      text = ggplot2::element_text(color = "#00ffff"),
      plot.title = ggplot2::element_text(
        color = "#ff00ff",
        size = base_size * 1.5,
        face = "bold",
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(color = "#00ffff", hjust = 0.5),
      axis.text = ggplot2::element_text(color = "#ff66ff"),
      axis.title = ggplot2::element_text(color = "#66ffff", face = "bold"),
      axis.ticks = ggplot2::element_line(color = "#ff00ff"),
      axis.line = ggplot2::element_line(color = "#00ffff", linewidth = 0.8),
      legend.background = ggplot2::element_rect(fill = "#0f0f1a", color = "#ff00ff"),
      legend.key = ggplot2::element_rect(fill = "#0f0f1a"),
      legend.text = ggplot2::element_text(color = "#ff66ff"),
      legend.title = ggplot2::element_text(color = "#00ffff"),
      strip.background = ggplot2::element_rect(fill = "#1a0a2a", color = "#ff00ff"),
      strip.text = ggplot2::element_text(color = "#00ffff", face = "bold"),
      plot.margin = ggplot2::margin(20, 20, 20, 20)
    )
}

#' Asylum Theme
#'
#' Cold, clinical theme with desaturated colors, inspired by psychological horror.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_asylum <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#1a1a1a", color = NA),
      panel.background = ggplot2::element_rect(fill = "#202020", color = NA),
      panel.border = ggplot2::element_rect(color = "#404040", fill = NA, linewidth = 1),
      panel.grid.major = ggplot2::element_line(color = "#2a2a2a", linewidth = 0.5),
      panel.grid.minor = ggplot2::element_line(color = "#252525", linewidth = 0.3),
      text = ggplot2::element_text(color = "#909090"),
      plot.title = ggplot2::element_text(
        color = "#a0a0a0",
        size = base_size * 1.3,
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(color = "#707070", hjust = 0.5),
      axis.text = ggplot2::element_text(color = "#606060"),
      axis.title = ggplot2::element_text(color = "#808080"),
      axis.ticks = ggplot2::element_line(color = "#404040"),
      axis.line = ggplot2::element_line(color = "#404040"),
      legend.background = ggplot2::element_rect(fill = "#202020", color = "#404040"),
      legend.key = ggplot2::element_rect(fill = "#202020"),
      legend.text = ggplot2::element_text(color = "#808080"),
      legend.title = ggplot2::element_text(color = "#909090"),
      strip.background = ggplot2::element_rect(fill = "#2a2a2a", color = "#404040"),
      strip.text = ggplot2::element_text(color = "#909090"),
      plot.margin = ggplot2::margin(15, 15, 15, 15)
    )
}

#' Occult Theme
#'
#' Dark purple and gold theme inspired by occult/satanic horror.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_occult <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#0a0510", color = NA),
      panel.background = ggplot2::element_rect(fill = "#0f0a14", color = NA),
      panel.border = ggplot2::element_rect(color = "#d4af37", fill = NA, linewidth = 1.5),
      panel.grid.major = ggplot2::element_line(color = "#1a1020", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_line(color = "#150c1a", linewidth = 0.2),
      text = ggplot2::element_text(color = "#c0a0d0"),
      plot.title = ggplot2::element_text(
        color = "#d4af37",
        size = base_size * 1.4,
        face = "bold",
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(color = "#9060a0", hjust = 0.5),
      axis.text = ggplot2::element_text(color = "#8060a0"),
      axis.title = ggplot2::element_text(color = "#a080c0", face = "bold"),
      axis.ticks = ggplot2::element_line(color = "#d4af37"),
      axis.line = ggplot2::element_line(color = "#4a2060"),
      legend.background = ggplot2::element_rect(fill = "#0f0a14", color = "#d4af37"),
      legend.key = ggplot2::element_rect(fill = "#0f0a14"),
      legend.text = ggplot2::element_text(color = "#a080c0"),
      legend.title = ggplot2::element_text(color = "#d4af37"),
      strip.background = ggplot2::element_rect(fill = "#1a1028", color = "#d4af37"),
      strip.text = ggplot2::element_text(color = "#d4af37", face = "bold"),
      plot.margin = ggplot2::margin(15, 15, 15, 15)
    )
}

#' Forest Witch Theme
#'
#' Dark forest greens and earthy browns, inspired by folk horror.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_witch <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#0a100a", color = NA),
      panel.background = ggplot2::element_rect(fill = "#0f140f", color = NA),
      panel.border = ggplot2::element_rect(color = "#2a3a2a", fill = NA, linewidth = 1),
      panel.grid.major = ggplot2::element_line(color = "#1a201a", linewidth = 0.3),
      panel.grid.minor = ggplot2::element_line(color = "#151a15", linewidth = 0.2),
      text = ggplot2::element_text(color = "#8a9a7a"),
      plot.title = ggplot2::element_text(
        color = "#6a8a5a",
        size = base_size * 1.3,
        face = "bold",
        hjust = 0.5
      ),
      plot.subtitle = ggplot2::element_text(color = "#5a7a4a", hjust = 0.5),
      axis.text = ggplot2::element_text(color = "#5a6a4a"),
      axis.title = ggplot2::element_text(color = "#7a8a6a"),
      axis.ticks = ggplot2::element_line(color = "#3a4a3a"),
      axis.line = ggplot2::element_line(color = "#3a4a3a"),
      legend.background = ggplot2::element_rect(fill = "#0f140f", color = "#2a3a2a"),
      legend.key = ggplot2::element_rect(fill = "#0f140f"),
      legend.text = ggplot2::element_text(color = "#7a8a6a"),
      legend.title = ggplot2::element_text(color = "#8a9a7a"),
      strip.background = ggplot2::element_rect(fill = "#1a241a", color = "#2a3a2a"),
      strip.text = ggplot2::element_text(color = "#8a9a7a"),
      plot.margin = ggplot2::margin(15, 15, 15, 15)
    )
}

#' Void Theme
#'
#' Minimalist cosmic horror theme with deep blacks and subtle highlights.
#'
#' @inheritParams horror_themes
#' @return A ggplot2 theme object
#' @export
theme_void_horror <- function(base_size = 12, base_family = "") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  ggplot2::theme_void(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#000000", color = NA),
      panel.background = ggplot2::element_rect(fill = "#000000", color = NA),
      text = ggplot2::element_text(color = "#404040"),
      plot.title = ggplot2::element_text(
        color = "#303030",
        size = base_size * 1.2,
        hjust = 0.5,
        margin = ggplot2::margin(b = 10)
      ),
      plot.subtitle = ggplot2::element_text(color = "#202020", hjust = 0.5),
      legend.background = ggplot2::element_rect(fill = "#000000", color = NA),
      legend.key = ggplot2::element_rect(fill = "#000000"),
      legend.text = ggplot2::element_text(color = "#404040"),
      legend.title = ggplot2::element_text(color = "#505050"),
      plot.margin = ggplot2::margin(20, 20, 20, 20)
    )
}
