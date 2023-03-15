library("magick")
library("showtext")
library(hexSticker)
library(tidyverse)
library(UCSCXenaTools)
library(png)
library(tidyverse)
library(lubridate)
library(ggridges)
library(grid)

font_add_google("Creepster", "creepster")


gf_background <- png::readPNG("posters/ghostface.png")

w <- matrix(rgb(gf_background[,,1],gf_background[,,2],
                gf_background[,,3], gf_background[,,4] * 0.35),
            nrow=dim(gf_background)[1])

horror_movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-11-01/horror_movies.csv')

horror_movies <- horror_movies %>%
  mutate(year = year(ymd(release_date)))

horror_comedies <- filter(horror_movies, grepl("Comedy",genre_names))
horror_comedies <- filter(horror_comedies, year > 2011)

p <- ggplot(horror_comedies, aes(x = `vote_average`, y = factor(year), fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01, alpha=0.01) +
  scale_fill_gradient(low = "#eb0e34",high = "#910019") +
  theme_void() +
  theme(
    legend.position="none",
    text = element_text(family = "nosifer", color = "#eb0e34"),
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    panel.grid.major = element_blank(),
    axis.title.x = element_blank(),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "black", color = NA),
    panel.background = element_rect(fill = "black", color = NA),
    legend.background = element_blank()) +
  annotation_custom(xmin=-Inf, ymin=-Inf, xmax=Inf, ymax=Inf, rasterGrob(w))


hexSticker::sticker(
  subplot =p, s_x = 1, s_y = 0.85, s_width = 3, s_height = 0.7,
  package = "horroR", p_x = 1, p_y = 1.3, p_size = 36, h_size = 1.2, p_family = "techmono",
  p_color = "red", h_fill = "black", h_color = "darkred",
  dpi = 320, filename = "logo.png")

image_read("logo.png")
