#' R4 I&M Project Report (PR) format.
#'
#' Format for creating a R4 Inventory and Monitoring Project Report
#' @inheritParams bookdown::pdf_book
#' @param ... Arguments to \code{bookdown::pdf_book}
#' @param keep_tex A boolean toggle to select whether intermediate
#' LaTeX files are to be kept, defaults to \code{FALSE}
#' @return output format to pass to \code{\link[rmarkdown:render_book]{render_book}}
#' @export
project_report <- function(..., keep_tex = FALSE) {
  pdf_book_format(...,
                  keep_tex = keep_tex,
                  format = "project_report",
                  template = "template.tex",
                  csl = "the-journal-of-wildlife-management.csl")
}