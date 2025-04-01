here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("data/AH_Provisional_Diabetes_Death_Counts_for_2020_20250130.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

library(labelled)
library(gtsummary)

var_label(data) <- list(
  Data.as.of = "Data of Enter",
  Date_Of_Death_Year = "Data of Death Year",
  Date_Of_Death_Month = "Data of Death Month",
  AgeGroup = "Age Group",
  Sex = "Sex",
  COVID19 = "COVID-19",
  Diabetes.uc = "Diabetes as uc",
  Diabetes.mc = "Diabetes as ucc",
  C19PlusDiabetes = "COVID-19 and diabetes",
  C19PlusHypertensiveDiseases = "COVID-19 and hyd",
  C19PlusMajorCardiovascularDiseases = "COVID-19 and mcd",
  C19PlusHypertensiveDiseasesAndMCVD = "COVID-19 and hyd and mcd",
  C19PlusChronicLowerRespiratoryDisease = "COVID-19 and clrd",
  C19PlusKidneyDisease = "COVID-19 and kd",
  C19PlusChronicLiverDiseaseAndCirrhosis = "COVID-19 and cld and c",
  C19PlusObesity = "COVID-19 and obseity"
)

print("I executed without any errors.")

saveRDS(
  data, 
  file = here::here("output/data_clean.rds")
)