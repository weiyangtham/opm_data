library(tidyverse)
library(magrittr)

dir = glue::glue(
  "/Volumes/research_data/opm-federal-employment-data/data/",
  "1973-09-to-2014-06/non-dod/status/",
  "Status_Non_DoD_2009_12.txt")

read_delim(dir, 
           col_names = FALSE,
           delim = "|",
           n_max = 1e5) 

# widths = c(9, 35, 8, 205, 205, 2, 12, 17, 4, 4, 4, 16, 205, 4, 12, 4, 4, 4, 1)

widths = c(9, 12, 8, 2, 11, 5, 6, 5, 16)

read_fwf(dir, fwf_widths(widths), n_max = 5000)


df


dir2 = glue::glue("/Volumes/research_data/opm-federal-employment-data/data/", 
                  "2014-09-to-2016-09/non-dod/status/", "Non_DoD_201609.txt")

x = read_delim(dir2, 
           col_names = FALSE,
           delim = "|",
           n_max = Inf) 



    