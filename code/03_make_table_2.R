here::i_am("code/02_make_table.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

# Data Clean; Counting the number of death in different age groups.
library(dplyr)
library(ggplot2)

df_combined <- data %>%
  group_by(AgeGroup) %>%
  summarise(across(where(is.numeric), sum, na.rm = TRUE))

df_new <- df_combined[, !names(df_combined) %in% c("Date_Of_Death_Year", "Date_Of_Death_Month")]

plot2 <- ggplot(df_new, aes(x = AgeGroup, y = Diabetes.uc)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Death due to diabetes Relate to Different Age Group",
       x = "Age Group",
       y = "Diabetes Death Number") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  here::here("output/plot2.png"),
  plot = plot2,
  device = "png"
)