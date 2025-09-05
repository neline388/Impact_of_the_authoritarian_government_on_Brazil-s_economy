library(readxl)
library(dplyr)
library(ggplot2)

# _________________________ V-Dem: Liberal Democracy _______________________

vdem_data <- vdem %>%
  filter(country_name %in% selected_countries, year >= 1950, year <= 2000) %>%
  select(country_name, year, v2x_libdem)

ggplot(vdem_data, aes(x = year, y = v2x_libdem, color = country_name)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Liberal Democracy",
    x = "Year",
    y = "V-Dem Liberal Democracy score",
    color = "Country"
  ) +
  theme_minimal()


# ___________________________GDP per Capita__________________________

gdp_pc_data <- pwt10.0 %>%
  filter(country %in% selected_countries, year >= 1964 & year <= 2000) %>%
  select(country, year, rgdpe, pop) %>%
  mutate(gdppc = rgdpe / pop)

ggplot(gdp_pc_data, aes(x = year, y = gdppc, color = country)) +
  geom_line(size = 1) +
  geom_vline(xintercept = 1985, linetype = "dashed", color = "black") + 
  labs(x = "Year", y = "GDP per capita", color = "Country") +
  scale_x_continuous(breaks = seq(1965, 2000, by = 5)) +
  theme_minimal()
