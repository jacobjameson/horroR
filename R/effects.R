#' Horror Special Effects and Annotations for ggplot2
#'
#' Functions to add creepy effects, annotations, and embellishments to plots.
#'
#' @name horror_effects
NULL

#' Add blood drip effect to plot
#'
#' Creates a dripping blood effect along the top of the plot.
#'
#' @param n Number of drips (default 10)
#' @param color Blood color (default "#8b0000")
#' @param intensity How far drips extend (0-1, default 0.3)
#' @param seed Random seed for reproducibility
#'
#' @return A list of ggplot2 annotation layers
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point() +
#'   blood_drips() +
#'   theme_horror()
#' }
blood_drips <- function(n = 10, color = "#8b0000", intensity = 0.3, seed = NULL) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  if (!is.null(seed)) set.seed(seed)

  # Generate random drip positions and lengths
  drip_data <- data.frame(
    x = stats::runif(n, 0.05, 0.95),
    length = stats::runif(n, 0.05, intensity),
    width = stats::runif(n, 0.01, 0.03)
  )

  drip_annotations <- lapply(seq_len(nrow(drip_data)), function(i) {
    d <- drip_data[i, ]
    ggplot2::annotation_custom(
      grob = grid::roundrectGrob(
        x = grid::unit(d$x, "npc"),
        y = grid::unit(1 - d$length/2, "npc"),
        width = grid::unit(d$width, "npc"),
        height = grid::unit(d$length, "npc"),
        r = grid::unit(0.5, "npc"),
        gp = grid::gpar(fill = color, col = NA, alpha = 0.9)
      ),
      xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
    )
  })

  drip_annotations
}

#' Add scratch marks effect
#'
#' Adds diagonal scratch marks across the plot.
#'
#' @param n Number of scratches (default 5)
#' @param color Scratch color (default "#333333")
#' @param alpha Transparency (default 0.5)
#' @param seed Random seed for reproducibility
#'
#' @return A list of ggplot2 annotation layers
#' @export
scratch_marks <- function(n = 5, color = "#333333", alpha = 0.5, seed = NULL) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  if (!is.null(seed)) set.seed(seed)

  scratch_annotations <- lapply(seq_len(n), function(i) {
    x_start <- stats::runif(1, 0.1, 0.9)
    y_start <- stats::runif(1, 0.3, 0.9)
    length <- stats::runif(1, 0.1, 0.3)
    angle <- stats::runif(1, -0.5, 0.5)

    ggplot2::annotation_custom(
      grob = grid::segmentsGrob(
        x0 = grid::unit(x_start, "npc"),
        y0 = grid::unit(y_start, "npc"),
        x1 = grid::unit(x_start + length * cos(angle), "npc"),
        y1 = grid::unit(y_start - length * sin(angle) - 0.1, "npc"),
        gp = grid::gpar(col = color, lwd = stats::runif(1, 1, 3), alpha = alpha)
      ),
      xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
    )
  })

  scratch_annotations
}

#' Add vignette effect (darkened edges)
#'
#' Creates a vignette effect with darkened corners and edges.
#'
#' @param color Vignette color (default "black")
#' @param intensity How dark the edges are (0-1, default 0.4)
#' @param radius How far the vignette extends (0-1, default 0.8)
#'
#' @return A ggplot2 annotation layer
#' @export
vignette_effect <- function(color = "black", intensity = 0.4, radius = 0.8) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  # Create a radial gradient effect using multiple rectangles
  n_layers <- 10
  layers <- lapply(seq_len(n_layers), function(i) {
    alpha_val <- intensity * (i / n_layers) * 0.3
    margin <- (1 - radius) * (i / n_layers)

    ggplot2::annotation_custom(
      grob = grid::rectGrob(
        gp = grid::gpar(
          fill = NA,
          col = grDevices::adjustcolor(color, alpha.f = alpha_val),
          lwd = 20 * (n_layers - i + 1) / n_layers
        )
      ),
      xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
    )
  })

  layers
}

#' Add fog/mist effect
#'
#' Creates a misty atmosphere with semi-transparent clouds.
#'
#' @param n Number of fog patches (default 15)
#' @param color Fog color (default "#888888")
#' @param intensity Opacity of fog (0-1, default 0.15)
#' @param seed Random seed for reproducibility
#'
#' @return A list of ggplot2 annotation layers
#' @export
fog_effect <- function(n = 15, color = "#888888", intensity = 0.15, seed = NULL) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  if (!is.null(seed)) set.seed(seed)

  fog_layers <- lapply(seq_len(n), function(i) {
    x <- stats::runif(1, 0, 1)
    y <- stats::runif(1, 0, 1)
    size <- stats::runif(1, 0.1, 0.4)

    ggplot2::annotation_custom(
      grob = grid::circleGrob(
        x = grid::unit(x, "npc"),
        y = grid::unit(y, "npc"),
        r = grid::unit(size, "npc"),
        gp = grid::gpar(
          fill = grDevices::adjustcolor(color, alpha.f = intensity),
          col = NA
        )
      ),
      xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
    )
  })

  fog_layers
}

#' Add glitch effect
#'
#' Creates digital glitch/corruption effect with displaced rectangles.
#'
#' @param n Number of glitch bars (default 8)
#' @param colors Vector of glitch colors (default neon colors)
#' @param intensity Opacity (0-1, default 0.3)
#' @param seed Random seed for reproducibility
#'
#' @return A list of ggplot2 annotation layers
#' @export
glitch_effect <- function(n = 8, colors = c("#ff0000", "#00ff00", "#0000ff", "#ff00ff", "#00ffff"),
                          intensity = 0.3, seed = NULL) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  if (!is.null(seed)) set.seed(seed)

  glitch_layers <- lapply(seq_len(n), function(i) {
    y <- stats::runif(1, 0, 1)
    height <- stats::runif(1, 0.01, 0.05)
    x_offset <- stats::runif(1, -0.1, 0.1)
    color <- sample(colors, 1)

    ggplot2::annotation_custom(
      grob = grid::rectGrob(
        x = grid::unit(0.5 + x_offset, "npc"),
        y = grid::unit(y, "npc"),
        width = grid::unit(1.2, "npc"),
        height = grid::unit(height, "npc"),
        gp = grid::gpar(
          fill = grDevices::adjustcolor(color, alpha.f = intensity),
          col = NA
        )
      ),
      xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
    )
  })

  glitch_layers
}

#' Add static/noise effect
#'
#' Creates TV static noise effect.
#'
#' @param n Number of noise particles (default 500)
#' @param colors Vector of static colors
#' @param intensity Opacity (0-1, default 0.1)
#' @param seed Random seed for reproducibility
#'
#' @return A ggplot2 annotation layer
#' @export
static_effect <- function(n = 500, colors = c("#ffffff", "#cccccc", "#999999", "#666666"),
                          intensity = 0.1, seed = NULL) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  if (!is.null(seed)) set.seed(seed)

  x_pos <- stats::runif(n, 0, 1)
  y_pos <- stats::runif(n, 0, 1)
  point_colors <- sample(colors, n, replace = TRUE)

  # Create a grob with all points
  ggplot2::annotation_custom(
    grob = grid::pointsGrob(
      x = grid::unit(x_pos, "npc"),
      y = grid::unit(y_pos, "npc"),
      pch = 15,
      size = grid::unit(0.5, "mm"),
      gp = grid::gpar(col = grDevices::adjustcolor(point_colors, alpha.f = intensity))
    ),
    xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf
  )
}

#' Creepy text annotation
#'
#' Adds text with horror-style formatting (can include "shaking" effect via multiple layers).
#'
#' @param label Text to display
#' @param x X position (0-1)
#' @param y Y position (0-1)
#' @param color Text color (default "#8b0000")
#' @param size Font size (default 5)
#' @param shake Add shake effect with multiple offset layers (default FALSE)
#' @param shake_intensity How much the text shakes (default 0.005)
#'
#' @return A ggplot2 annotation layer or list of layers
#' @export
creepy_text <- function(label, x = 0.5, y = 0.5, color = "#8b0000", size = 5,
                        shake = FALSE, shake_intensity = 0.005) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 is required for this function")
  }

  if (shake) {
    offsets <- list(
      c(-shake_intensity, -shake_intensity),
      c(shake_intensity, -shake_intensity),
      c(-shake_intensity, shake_intensity),
      c(shake_intensity, shake_intensity)
    )

    layers <- lapply(offsets, function(off) {
      ggplot2::annotate(
        "text",
        x = x + off[1], y = y + off[2],
        label = label,
        color = grDevices::adjustcolor(color, alpha.f = 0.3),
        size = size
      )
    })

    # Add main text on top
    layers[[length(layers) + 1]] <- ggplot2::annotate(
      "text",
      x = x, y = y,
      label = label,
      color = color,
      size = size,
      fontface = "bold"
    )

    layers
  } else {
    ggplot2::annotate(
      "text",
      x = x, y = y,
      label = label,
      color = color,
      size = size,
      fontface = "bold"
    )
  }
}

#' Get a random spooky message
#'
#' Returns a random creepy message for plot annotations.
#'
#' @return A character string
#' @export
#'
#' @examples
#' spooky_message()
spooky_message <- function() {
  messages <- c(
    "They're watching...",
    "Don't look behind you",
    "Can you hear them?",
    "The data is cursed",
    "Something is wrong with the numbers",
    "It follows...",
    "No escape",
    "We've been expecting you",
    "The correlation is... unnatural",
    "These outliers aren't random",
    "Trust no observation",
    "The residuals remember",
    "p < 0.05... or else",
    "Beware the mean",
    "Standard deviation from sanity",
    "Your data has been... processed"
  )
  sample(messages, 1)
}

#' Get list of available horror effects
#'
#' Returns information about all available horror effects.
#'
#' @return A data frame with effect names and descriptions
#' @export
list_effects <- function() {
  data.frame(
    effect = c(
      "blood_drips()",
      "scratch_marks()",
      "vignette_effect()",
      "fog_effect()",
      "glitch_effect()",
      "static_effect()",
      "creepy_text()"
    ),
    description = c(
      "Dripping blood effect from top of plot",
      "Diagonal scratch marks across the plot",
      "Darkened edges/corners vignette",
      "Misty fog atmosphere",
      "Digital glitch/corruption bars",
      "TV static noise overlay",
      "Horror-styled text annotation with optional shake"
    ),
    stringsAsFactors = FALSE
  )
}
