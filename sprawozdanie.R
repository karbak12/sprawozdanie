library(tidyverse)

dane <- read_csv2("C:/Users/admin/Desktop/studia/semestr 5/pakiety statystyczne/WIID_28NOV2023.csv")
cleaned_data <- dane %>% select(country, c3, year, gini, resource_detailed, scale_detailed, region_un,region_un_sub, eu, gdp)
data_filt <- cleaned_data %>% filter(if_all(everything(), ~ !is.na(.)))


data_filt[, c("country", "c3", "resource_detailed", "scale_detailed", "region_un","region_un_sub", "eu")] <- lapply(data_filt[, c("country", "c3", "resource_detailed", "scale_detailed", "region_un","region_un_sub", "eu")], as.factor)
