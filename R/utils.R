#' Utility functions for horroR package
#'
#' @name horroR_utils
NULL

#' List all available palettes
#'
#' Displays all horror palettes available in the package, organized by category.
#'
#' @param category Filter by category: "movies", "mood", or "all" (default)
#' @return A character vector of palette names (invisibly)
#' @export
#'
#' @examples
#' list_palettes()
#' list_palettes("mood")
list_palettes <- function(category = "all") {
  movie_palettes <- c(
    "Suspiria", "Coraline", "Scream", "NightmareOnElmStreet", "TheShining",
    "TheNeonDemon", "Midsommar", "Silenceofthelambs", "TheExorcist", "GetOut",
    "Hereditary", "TheWitch", "ItFollows", "Halloween", "TheRing", "Us",
    "AQuietPlace", "Carrie", "Psycho", "TheTexasChainsawMassacre", "Alien",
    "TheThing", "Jaws", "Poltergeist", "TheOmen", "Rosemary", "Blair",
    "Conjuring", "Insidious", "Sinister"
  )

  mood_palettes <- c(
    "blood", "ghostly", "demonic", "forestwitch", "neonslasher",
    "vintage", "asylum", "occult", "nightmare", "decay"
  )

  result <- switch(category,
    "movies" = {
      cat("Horror Movie Palettes:\n")
      cat(paste(" ", movie_palettes, collapse = "\n"), "\n")
      movie_palettes
    },
    "mood" = {
      cat("Mood-Based Palettes:\n")
      cat(paste(" ", mood_palettes, collapse = "\n"), "\n")
      mood_palettes
    },
    "all" = {
      cat("Horror Movie Palettes:\n")
      cat(paste(" ", movie_palettes, collapse = "\n"), "\n\n")
      cat("Mood-Based Palettes:\n")
      cat(paste(" ", mood_palettes, collapse = "\n"), "\n")
      c(movie_palettes, mood_palettes)
    },
    stop("Category must be 'movies', 'mood', or 'all'")
  )

  invisible(result)
}

#' List all available themes
#'
#' Displays all horror themes available in the package.
#'
#' @return A data frame with theme names and descriptions (invisibly)
#' @export
#'
#' @examples
#' list_themes()
list_themes <- function() {
  themes <- data.frame(
    theme = c(
      "theme_horror()",
      "theme_slasher()",
      "theme_supernatural()",
      "theme_vintage()",
      "theme_neon()",
      "theme_asylum()",
      "theme_occult()",
      "theme_witch()",
      "theme_void_horror()"
    ),
    description = c(
      "Dark base theme with blood-red accents",
      "High contrast blood red and black (80s slasher)",
      "Ethereal, ghostly pale blues and grays",
      "Old film sepia tones (classic horror)",
      "Vibrant neon on dark (neon-noir horror)",
      "Cold, clinical desaturated (psychological horror)",
      "Dark purple and gold (occult/satanic)",
      "Forest greens and earthy browns (folk horror)",
      "Minimalist cosmic horror with deep blacks"
    ),
    stringsAsFactors = FALSE
  )

  cat("Available Horror Themes:\n\n")
  for (i in seq_len(nrow(themes))) {
    cat(sprintf("  %-22s %s\n", themes$theme[i], themes$description[i]))
  }

  invisible(themes)
}

#' Preview a palette
#'
#' Display a visual preview of a horror palette.
#'
#' @param name Name of the palette to preview
#' @param n Number of colors to display (uses palette max if not specified)
#' @param type "discrete" or "continuous"
#'
#' @return The palette (invisibly)
#' @export
#'
#' @examples
#' preview_palette("Suspiria")
#' preview_palette("blood", n = 20, type = "continuous")
preview_palette <- function(name, n = NULL, type = "discrete") {
  if (is.null(n)) {
    pal <- horroR_palette(name, type = "discrete")
  } else {
    pal <- horroR_palette(name, n = n, type = type)
  }
  print(pal)
  invisible(pal)
}

#' Show all palettes visually
#'
#' Creates a visual display of all or selected palettes.
#'
#' @param palettes Vector of palette names to show, or "all" for all palettes
#' @param n Number of colors per palette (default: palette maximum)
#'
#' @return NULL (called for side effect of displaying palettes)
#' @export
#'
#' @examples
#' \dontrun{
#' show_palettes()
#' show_palettes(c("Suspiria", "blood", "TheShining"))
#' }
show_palettes <- function(palettes = "all", n = NULL) {
  if (identical(palettes, "all")) {
    palettes <- names(horroR_palettes)
  }

  n_palettes <- length(palettes)
  old_par <- graphics::par(mfrow = c(ceiling(n_palettes / 3), 3),
                           mar = c(0.5, 0.5, 1.5, 0.5))
  on.exit(graphics::par(old_par))

  for (pal_name in palettes) {
    if (is.null(n)) {
      pal <- horroR_palette(pal_name, type = "discrete")
    } else {
      pal <- horroR_palette(pal_name, n = n, type = "continuous")
    }
    n_cols <- length(pal)

    graphics::image(1:n_cols, 1, as.matrix(1:n_cols), col = pal,
                    xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n")
    graphics::title(main = pal_name, line = 0.3, cex.main = 0.9)
  }
}

#' Get horror color by name
#'
#' Convenience function to get a specific color from a palette.
#'
#' @param palette Name of the palette
#' @param index Index of the color (1-based)
#'
#' @return A hex color string
#' @export
#'
#' @examples
#' horror_color("blood", 4)  # Get the 4th color from the blood palette
horror_color <- function(palette, index = 1) {
  pal <- horroR_palettes[[palette]]
  if (is.null(pal)) {
    stop("Palette '", palette, "' not found. Use list_palettes() to see available options.")
  }
  if (index < 1 || index > length(pal)) {
    stop("Index must be between 1 and ", length(pal), " for palette '", palette, "'")
  }
  pal[index]
}

#' Make any color creepier
#'
#' Darkens and desaturates a color to make it more horror-appropriate.
#'
#' @param color Hex color or color name
#' @param darkness How much to darken (0-1, default 0.3)
#' @param desaturation How much to desaturate (0-1, default 0.2)
#'
#' @return A hex color string
#' @export
#'
#' @examples
#' creepify_color("#00ff00")  # Make bright green creepy
#' creepify_color("pink", darkness = 0.5)
creepify_color <- function(color, darkness = 0.3, desaturation = 0.2) {
  # Convert to RGB
  rgb_vals <- grDevices::col2rgb(color) / 255

  # Convert to HSV
  hsv_vals <- grDevices::rgb2hsv(rgb_vals[1], rgb_vals[2], rgb_vals[3])

  # Reduce saturation and value
  new_s <- max(0, hsv_vals[2, 1] - desaturation)
  new_v <- max(0, hsv_vals[3, 1] - darkness)

  # Convert back to hex
  grDevices::hsv(hsv_vals[1, 1], new_s, new_v)
}
