
library("shiny")
library("shinysky")
library("data.table")
diseases <- fread("data/lachman_table.csv")
features <- sort(unique(diseases$feature))