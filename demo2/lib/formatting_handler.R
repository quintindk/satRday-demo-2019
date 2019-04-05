formatting_handler <- function(request, response, keys, ...) {
    if (!request$parse_raw()) {
        response$status <- 400L
        response$body <- list(h1 = "Can't parse HTTP POST body")
        return (FALSE)
    } else {
        body <- rawToChar(request$body)
        data <- try(fromJSON(body), silent=TRUE)
        if (class(data) == "try-error") {
            response$status <- 400L
            response$body <- paste0("<h1>I excpected well formatted JSON, you sent me ", body, "</h1>")
            return(FALSE)
        }
        request$set_body(body)
        response$status <- 200L
        return (TRUE)
    }
}
