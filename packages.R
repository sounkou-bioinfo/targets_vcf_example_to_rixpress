## library() calls go here
library(future)
library(future.callr)
library(conflicted)
library(dotenv) # load variables in .env into current R session
library(fs)
library(tidyverse)
library(targets)
library(tarchetypes)
library(rmarkdown)
library(processx)
conflicts_prefer(dplyr::filter)
