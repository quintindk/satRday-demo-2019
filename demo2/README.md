# satRdays

## demo1

```r
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
```

## switch to demo2

```r
# add lib folder for functions
library(ProjectTemplate)
load.project()
```

## data

## munge file 01-colnames

```r
# add munge file 01-names
colnames(iris) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")
iris <- iris[!is.na(iris$Species),]
```

## train and save

```
iris %>% ggvis(~Sepal.Length, ~Sepal.Width, fill = ~Species) %>% layer_points()

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
```

## fiery

## routr

## fiery with project template

[http://127.0.0.1:8090]()

```bash
curl --header "Content-Type: application/json" --request POST --data 'hello satRdays' http://localhost:9092/predict/
```

```bash
curl --header "Content-Type: application/json" --request POST --data @test.json http://localhost:9092/predict/
```

```bash
mkdir app
rm -r app/*
cp -r ../cache app
cp -r ../config app
cp -r ../data app
cp -r ../lib app
cp -r ../munge app
cp -r ../src app
docker build -t r-prediction-api:0.0.1 .
```

# [https://www.rstudio.com/](https://www.rstudio.com/)
# [http://projecttemplate.net/](http://projecttemplate.net/)
# [https://github.com/thomasp85/fiery](https://github.com/thomasp85/fiery)
# [https://github.com/thomasp85/routr](https://github.com/thomasp85/routr)
# [https://www.datacamp.com/community/tutorials/machine-learning-in-r](https://www.datacamp.com/community/tutorials/machine-learning-in-r)