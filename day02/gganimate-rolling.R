library(tidyverse)
library(gganimate)

slide_window <- economics %>%
  pull(date) %>%
  tsibble::slider(.size = 90) %>%
  map_dfr(function(x) tibble(xmin = min(x), xmax = max(x))) %>%
  mutate(ymin = -Inf, ymax = Inf, group = row_number())

p_slide <- ggplot() +
  geom_line(aes(x = date, y = unemploy), data = economics) +
  geom_rect(aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax,
    group = group), data = slide_window, size = 1.5, alpha = 0.6,
    fill = "#9ecae1", colour = "#9ecae1") +
  theme_bw() +
  transition_manual(group)
anim_save("day02/slide.gif", p_slide, width = 800, height = 250)
