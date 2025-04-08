here::i_am("code/01_make_report.R")

# Read in the clean data
data <- readRDS(file = here::here("output/data_clean.rds"))

# Load required libraries
library(dplyr)
library(gtsummary)

# Data Clean: Count the number of deaths in different age groups
df_combined <- data %>%
  group_by(AgeGroup) %>%
  summarise(across(where(is.numeric), \(x) sum(x, na.rm = TRUE)))

# Remove unwanted columns
df_new <- df_combined[, !names(df_combined) %in% c("Date_Of_Death_Year", "Date_Of_Death_Month")]

# Create a gtsummary table for selected variables
table_one <- df_new %>%
  select("AgeGroup", "COVID19", "Diabetes.uc") %>%
  tbl_summary(by = AgeGroup) %>%
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Death rank in COVID19 and Diabetes**") %>%
  add_overall() %>%
  add_p()

# Print the table to the R console
print(table_one)

# Save the gtsummary table as an RDS file for later use
saveRDS(table_one, file = here::here("output", "table_one.rds"))