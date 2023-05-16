#  ------------------------------------------------------------------------
#
# Title : App - Global
#    By : Quentin Villotta
#  Date : 16/05/2023
#    
#  ------------------------------------------------------------------------


# Packages ----------------------------------------------------------------

library(shiny)
library(googleway)
library(dplyr)
library(sf)
library(readxl)
library(colorRamps)
library(jsonlite)



# Funs --------------------------------------------------------------------

# source("funs/summarise_etablissements.R")
# source("funs/descriptif_application.R", encoding = "UTF-8")


# Datas -------------------------------------------------------------------

# Google Maps API
gm_api_key <- read_json(path = "data/API_keys.json")$google_map_api$api_key

# Syria district gdb database
gdb_path <- "data/SYR_AdminBoundaries_candidate.gdb/"
sda_gdb <- st_read(gdb_path)

# HSOS syria 03/2023 data
hsos_path <- "data/REACH_SYR_HSOS_Dataset_March2023_NWS.xlsx"
hsos_sheet <- "Dataset"
hsos <- read_excel(path=hsos_path, sheet=hsos_sheet)

# Color - Cgenerate a continuous color palette
rbPal <- colorRampPalette(c('green','yellow', 'red'))

# Data Managements ---------------------------------------------------------

# Input : Var selection
match_col_expr_IDP <- "Three most common IDP shelter types -"
input_colnames <- select(hsos, contains(match_col_expr_IDP)) %>% colnames()
input_colnames


