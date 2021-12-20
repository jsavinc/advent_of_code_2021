# Day 2

moves <- read_delim(file = "./day2input.txt", delim = " ", col_names = c("direction", "value"))
moves %>%
  group_by(direction) %>%
  summarise(total = sum(value)) %>%
  pivot_wider(names_from = "direction", values_from = "total") %>%
  summarise(forward = forward, down = down - up) %>%
  summarise(solution = down * forward)

moves %>%
  mutate(
    aim_contribution = case_when(
      direction == "forward" ~ 0,
      direction == "up" ~ -value,
      direction == "down" ~ value,
      TRUE ~ 0
    ),
    aim = cumsum(aim_contribution)
  ) %>%
  filter(direction == "forward") %>%
  summarise(
    horizontal_position = sum(value),
    depth = sum(value*aim)
  ) %>%
  mutate(solution = horizontal_position * depth)
