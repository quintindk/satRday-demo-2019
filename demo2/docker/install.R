if (!require(ProjectTemplate)) {
    install.packages("ProjectTemplate")
    library(ProjectTemplate)
}
setwd("/app/")
load.project()