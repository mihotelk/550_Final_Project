here::i_am("code/02_make_table.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

# Data Clean; Counting the number of death in different age groups.
library(dplyr)

df_combined <- data %>%
  group_by(AgeGroup) %>%
  summarise(across(where(is.numeric), sum, na.rm = TRUE))

df_new <- df_combined[, !names(df_combined) %in% c("Date_Of_Death_Year", "Date_Of_Death_Month")]

library(ggplot2)

plot1 <- ggplot(df_new, aes(x = AgeGroup, y = COVID19)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Death due to COVID-19 Relate to Different Age Group",
       x = "Age Group",
       y = "COVID-19 Death Number") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  here::here("output/plot1.png"),
  plot = plot1,
  device = "png"
)

