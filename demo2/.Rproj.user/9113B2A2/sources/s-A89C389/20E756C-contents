library(fiery)

# Create a New App
app <- Fire$new()
route <- Route$new()

fallback <- function(request, response, keys, ...) {
    response$status <- 200L
    response$type <- 'html'
    response$body <- '<h1>I\'m not saying hello to you</h1>'
    return(FALSE)
}
route$add_handler('get', '/*', fallback)

hellow <- function(request, response, keys, ...) {
    response$status <- 200L
    response$type <- 'html'
    response$body <- paste0('<h1>Hello ', keys$who, '!</h1>')
    return(FALSE)
}
route$add_handler('get', '/hello/:who/', hellow)

router <- RouteStack$new()
router$add_route(route, 'test')

app$attach(router)

# Assign ports
app$port = 8090

# Start
app$ignite()
