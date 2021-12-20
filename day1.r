# Day 1
library(tidyverse)

depths <- read_csv("./day1input.txt", col_names = "depth")

depths %>%
  mutate(increased = (lead(depth, n=1)-depth) > 0) %>%
  summarise(n_increased = sum(increased, na.rm=TRUE))
# 1482

depths %>%
  mutate(
    window3 = depth + lead(depth, n=1) + lead(depth, n=2),
    increased = (lead(window3, n=1)-window3) > 0
  ) %>%
      summarise(n_increased = sum(increased, na.rm=TRUE))
