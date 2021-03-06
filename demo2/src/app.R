if (!require(ProjectTemplate)) {
    install.packages("ProjectTemplate")
    library(ProjectTemplate)
}
load.project()

router <- RouteStack$new()
fallback <- Route$new()
prediction <- Route$new()
formatting <- Route$new()

fallback$add_handler("get", "/*", fallback_handler)
formatting$add_handler("post", "/*", formatting_handler)
prediction$add_handler("post", "/predict/", predict_handler)

router$add_route(fallback, "fallback")
router$add_route(formatting, "formatting")
router$add_route(prediction, "prediction")

app <- Fire$new(port = 8090)
app$attach(router)
app$ignite(block = TRUE)
