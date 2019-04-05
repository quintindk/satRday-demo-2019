predict_handler <- function(request, response, keys, ...) {
    body <- fromJSON(request$body)

    result <- predict(object=model.knn, body)

    response$status <- 200L
    response$body <- toJSON(result)
    return (TRUE)
}
