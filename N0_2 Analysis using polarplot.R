library(openair)
library(dplyr)
library(worldmet)
# import data from London North Kensington
north_ken <- importAURN(site = "kc1", year = 2013)
# import met data for site Heathrow London (which is the default)
met <- importNOAA(year = 2013)
# merge together, drop model met from north_ken
north_ken <- inner_join(select(north_ken, -ws, -wd),
                        met, by = "date")
# import data from London Marylebone Road
mary <- importAURN(site = "my1", year = 2013)
# merge together, drop model met from north_ken
mary <- inner_join(select(mary, -ws, -wd),
                   met, by = "date")
polarPlot(north_ken, pollutant = "nox", col = "jet",key.position = "bottom",
          key.header = "mean nox (ug/m3)", 
          key.footer = NULL)
