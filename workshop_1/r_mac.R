rm(list=ls())

getwd()

# absolute path
setwd("~/Desktop/TISS/tech_cluster/workshop_1/")

# relative path
data <- read.csv("../data/nhanes.csv")

head(data)
