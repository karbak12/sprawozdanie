library(tidyverse)

dane <- read_csv2("C:/Users/admin/Desktop/studia/semestr 5/pakiety statystyczne/WIID_28NOV2023.csv")
cleaned_data <- dane %>% select(country, c3, year, gini, resource_detailed, scale_detailed, region_un,region_un_sub, eu, gdp)
data_filt <- cleaned_data %>% filter(if_all(everything(), ~ !is.na(.)))

data_filt[, c("country", "c3", "resource_detailed", "scale_detailed", "region_un","region_un_sub", "eu")] <- lapply(data_filt[, c("country", "c3", "resource_detailed", "scale_detailed", "region_un","region_un_sub", "eu")], as.factor)

# Lepszy sposób na manipulowanie zbiorem danych
data2 <- read_csv2("dane_WIID_2023.csv") %>%
  filter(region_un == "Europe") %>% # Zostawianie danych tylko dla Europy
  select(country, c3, year, gini, resource_detailed, scale_detailed, region_un_sub, eu, gdp) %>% # Wybieranie kolumn które nas interesują
  filter(resource_detailed != "Consumption") # Usuwanie wierszy z Consumption

# Obliczam jaki procent danych jest w wybranych kolumnach
na_in_gini <-  mean(is.na(data2$gini), na.rm = TRUE) * 100
na_in_scale <- mean(is.na(data2$scale_detailed), na.rm = TRUE) * 100
print(na_in_gini) # To można uwzględnić w tekście, że np 30% gini to NA 
