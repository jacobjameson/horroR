<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src="logo.png" width="150" />

# Horror Movie Insprired Palettes

## Installation

``` r
install.packages("horroR")
```

**Or the development version**

``` r
devtools::install_github("jacobjameson/horroR")
```

## Usage

``` r
library("horroR")
names(horroR_palettes)
#> [1] "Suspiria"             "Coraline"             "Scream"              
#> [4] "NightmareOnElmStreet" "TheShining"           "TheNeonDemon"        
#> [7] "Midsommar"            "Silenceofthelambs"
```

## Palettes

### Suspiria (1977)

<img src="posters/Suspiria.jpg" width="300" />

``` r
horroR_palette("Suspiria")
```

![](figure/Suspiria-1.png)

### Midsommar (2019)

<img src="posters/Midsommar.jpeg" width="300" />

``` r
horroR_palette("Midsommar")
```

![](figure/Midsommar-1.png)

### The Neon Demono (2016)

<img src="posters/The%20Neon%20Demono.jpg" width="300" />

``` r
horroR_palette("TheNeonDemon")
```

![](figure/TheNeonDemon-1.png)

<img src="posters/SOTL.jpeg" width="300" />

``` r
horroR_palette("Silenceofthelambs")
```

![](figure/SOTl-1.png)

``` r
library("ggplot2")
ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar() +
  scale_fill_manual(values = horroR_palette("TheNeonDemon"))
```

![](figure/ggplot1-1.png)

``` r
pal <- horroR_palette("Suspiria", 21, type = "continuous")
image(volcano, col = pal)
```

![](figure/volcano-1.png)

``` r
library("gridExtra")
library("scales")
data("diamonds")

p1 <- ggplot(
  subset(diamonds, carat >= 2.2),
  aes(x = table, y = price, colour = cut)
) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.09, size = 1, span = 1) +
  theme_bw()
#> Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
#> ℹ Please use `linewidth` instead.

p2 <- ggplot(
  subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
  aes(x = depth, fill = cut)
) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_bw()

p1_npg <- p1 + scale_color_manual(values = horroR_palette("Midsommar"))
p2_npg <- p2 + scale_fill_manual(values = horroR_palette("Midsommar"))

grid.arrange(p1_npg, p2_npg, ncol = 2)
#> `geom_smooth()` using formula = 'y ~ x'
```

<img src="figure/unnamed-chunk-2-1.png" width="800" height="300" />

``` r
p <- ggplot(
  data=subset(diamonds, cut != 'Fair'), 
  aes(x=price, group=cut, fill=cut)) +
    geom_density(adjust=1.5, position="fill") +
  theme_bw()

p + scale_fill_manual(values = horroR_palette("Silenceofthelambs"))
```

![](figure/unnamed-chunk-3-1.png)
