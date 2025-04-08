here::i_am("code/04_render_rmd.R")

library(rmarkdown)
library(here)

render("Final_project.Rmd", output_file = "Final_project.html")