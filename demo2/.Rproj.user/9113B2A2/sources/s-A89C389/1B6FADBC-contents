install.packages("ProjectTemplate")

library(ProjectTemplate)

getwd()
setwd("~/Repos/")

?create.project()

create.project(project.name = "demo1", template = "minimal", rstudio.project = TRUE)

# change config
# set load_libraries: TRUE
# set tables_type: data.frame
# set libraries: dplyr, ggvis, caret, jsonlite, fiery, routr

# add lib folder for functions
library(ProjectTemplate)
load.project()

# add munge file 01-names

colnames(iris) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")
iris <- iris[!is.na(iris$Species),]

iris %>% ggvis(~Sepal.Length, ~Sepal.Width, fill = ~Species) %>% layer_points()

# https://www.rstudio.com/
# https://code.visualstudio.com/
# http://projecttemplate.net/
# https://github.com/thomasp85/fiery
# https://github.com/thomasp85/routr
# https://www.datacamp.com/community/tutorials/machine-learning-in-r

# Partition the data
index <- createDataPartition(iris$Species, p=0.75, list=FALSE)

iris <- as.data.frame(iris)
str(iris)

# Subset training set with index
iris.training <- iris[index,]

# Subset test set with index
iris.test <- iris[-index,]

jsonlite::write_json(iris.test, "test/test.json")

# Train a model
model_knn <- caret::train(x= iris.training[, 1:4], y= iris.training[, 5], method='knn')
model_knn

saveRDS(model_knn, "data/model_knn.rds")

predictions<-predict(object=model_knn,iris.test[,1:4])



