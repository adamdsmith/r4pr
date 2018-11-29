find_file <- function(format, template) {
  template <- system.file("rmarkdown", "templates", format,
                          "resources", template, package = "r4pr")
  if (template == "") {
    stop("Couldn't find file.", call. = FALSE)
  }
  template
}

# Call bookdown::pdf_book and mark the return value as inheriting pdf_book
inherit_pdf_book <- function(...) {
  fmt <- bookdown::pdf_book(...)
  fmt$inherits <- "pdf_book"
  fmt
}

# Helper function to create a custom format derived from pdf_book
# that includes a custom LaTeX template and custom CSL definition
pdf_book_format <- function(..., format, template, csl) {
# base format
  fmt <- inherit_pdf_book(..., template = find_file(format, template))
  # add csl to pandoc_args
  fmt$pandoc$args <- c(fmt$pandoc$args,
                       "--csl",
                       rmarkdown::pandoc_path_arg(find_file(format, csl)))
  # return format
  fmt
}