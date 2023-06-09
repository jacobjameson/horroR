% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colors.R
\name{horroR_palette}
\alias{horroR_palette}
\title{A Horror Movie palette generator}
\usage{
horroR_palette(name, n, type = c("discrete", "continuous"))
}
\arguments{
\item{name}{Name of desired palette. Choices are:
\code{Suspiria}, \code{TheNeonDemon},  \code{Midsommar},
\code{Silenceofthelambs}}

\item{n}{Number of colors desired. Unfortunately most palettes now only
have 4 or 5 colors. But hopefully we'll add more palettes soon. All color
schemes are derived from movie posters.

\item{type}{Either "continuous" or "discrete". Use continuous if you want
to automatically interpolate between colours.
@importFrom graphics rgb rect par image text}
}
\value{
A vector of colours.
}
\description{
These are a handful of color palettes from horror movies.
}
\examples{
horroR_palette("Suspiria")
horroR_palette("Midsommar")
horroR_palette("TheNeonDemon")
horroR_palette("TheNeonDemon", 3)

# If you need more colours than normally found in a palette, you
# can use a continuous palette to interpolate between existing
# colours
pal <- horroR_palette(21, name = "Suspiria", type = "continuous")
image(volcano, col = pal)
}
\keyword{colors}
