assignment1 <- function() {

  library(knitr)
  library(markdown)
  
  options(markdown.HTML.options = "")
  knit2html("Assignment1.Rmd", "Assignment1.html", options="")
}
