fallback_handler <- function(request, response, keys, ...) {
    response$status <- 400L
    response$type <- "html"
    response$body <- paste0("<h1>Bad request. Please ensure you use the correct method and path.</h1>")
    return (FALSE)
}
