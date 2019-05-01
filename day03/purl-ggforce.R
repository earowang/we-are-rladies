## ----setup, include = FALSE----------------------------------------------
knitr::opts_knit$set(root.dir = here::here())


## ----facet-zoom, message = FALSE-----------------------------------------
library(ggforce)
ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) +
  geom_point() +
  facet_zoom(x = Species == "versicolor")


## ----geom-bezier, echo = FALSE-------------------------------------------
beziers <- data.frame(
  x = c(1, 2, 3, 4, 4, 6, 6),
  y = c(0, 2, 0, 0, 2, 2, 0),
  type = rep(c('cubic', 'quadratic'), c(3, 4)),
  point = c('end', 'control', 'end', 'end', 'control', 'control', 'end'),
  colour = letters[1:7]
)
help_lines <- data.frame(
  x = c(1, 3, 4, 6),
  xend = c(2, 2, 4, 6),
  y = 0,
  yend = 2
)

# See how control points affect the bezier
ggplot() +
  geom_segment(aes(x = x, xend = xend, y = y, yend = yend),
               data = help_lines,
               arrow = arrow(length = unit(c(0, 0, 0.5, 0.5), 'cm')),
               colour = 'grey') +
  geom_bezier(aes(x = x, y = y, group = type, linetype = type),
              data = beziers) +
  geom_point(aes(x = x, y = y, colour = point),
             data = beziers)


