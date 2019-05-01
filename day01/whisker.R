library(whisker)

person <- "Hadley"
tidyverse_pkgs <- c("ggplot2", "purrr", "tibble", "dplyr", "tidyr",
  "stringr", "readr", "forcats")
tidyverse_desc <- purrr::map_chr(tidyverse_pkgs,
  ~ packageDescription(., fields = "Description"))
names(tidyverse_desc) <- tidyverse_pkgs
tidyverse <- iteratelist(tidyverse_desc, name = "pkg", value = "desc")

template_md <-
  "> Hey {{ person }}! What is the tidyverse?

  The tidyverse is an opinionated collection of R packages:
  {{ #tidyverse }}
  * [**{{ pkg }}**](http://{{ pkg }}.tidyverse.org): {{ desc }}
  {{ /tidyverse }}
  "
# or
template_md <- readLines(here::here("day01", "template.md"))
done <- whisker.render(template_md,
  data = list(person = person, tidyverse = tidyverse))

usethis::write_over("day01/whisker.md", done, quiet = TRUE)
