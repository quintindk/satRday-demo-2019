library(fiery)

# Create a New App
app <- Fire$new()

app$on('request', function(server, request, ...) {
  response <- request$respond()
  response$status <- 200L
  response$body <- paste0('<h1>Hello World</h1>')
  response$type <- 'html'
})

# Assign ports
app$port = 8090

# Start
app$ignite()
