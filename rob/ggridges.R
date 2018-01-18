library(tidyverse)
library(magrittr)
library(viridis)

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

dir2 = glue::glue("E:/OPM Data/opm-federal-employment-data/data/2014-09-to-2016-09/non-dod/status/Non_DoD_201609.txt")


varnames = c("Family Name", "Given Name", "File Date", "Agency", "SubAgency", "State", "Age Range", "YSD (Year Since Degree) Range", "Education Level", "Pay Plan", "Grade", "LOS (Length of Service) Level", "Occupation", "Occupational Category (PATCO)", "Adjusted Basic Pay", "Supervisor", "TOA (Type of Appointment)", "Work Schedule", "NSFTP (Non-Seasonal Full-Time Permanent) Indicator")

df_pipe = read_delim(dir2, 
                     col_names = varnames, col_types = cols(),
                     delim = "|", na = c("", "NA", "*"), 
                     ) 

df_pipe

dep_com <- filter(df_pipe, Agency == "CM-DEPARTMENT OF COMMERCE", "Adjusted Basic Pay" != ".")

num <- mutate(dep_com, "Annual Earnings" = as.integer("Adjusted Basic Pay")) 
  
#Ridge
ggplot(data = dep_com, aes(x = "File Date", y = SubAgency)) +
  geom_density_ridges(scale = 1.2) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01, gradient_lwd = 1.) +
  scale_x_continuous(expand = c(0.01, 0)) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_fill_viridis(name = "Dollars", option = "C") +
  theme_ridges()
    