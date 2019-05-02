we_are_rladies <- function() {
  title <- cliapp::cli_h1("Welcome everyone!")
  header <- cliapp::cli_h2("day 1: Lesser known packages for automating")
  pkgs <- cliapp::cli_ol(c("whisker", "tic"))
  header <- cliapp::cli_h2("day 2: Data visualisation")
  funs <- cliapp::cli_ol(c("facet_geo()", "facet_calendar()"))
  header <- cliapp::cli_h2("day 3: R Markdown")
  tips <- cliapp::cli_ol(c("read_chunk()", "purl()", "animate.css"))
  ending <- cliapp::cli_alert_success("You rock #rstats commnunity!")
}

library(cliapp)
start_app(theme = simple_theme())
we_are_rladies()
