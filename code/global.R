library("shiny")
library("data.table")
diseases <- fread("../data/lachman_table.txt")
features <- sort(unique(diseases$feature))