# Final Project for DATA 550

## Generate report
This analysis was conducted using the Boston.csv data set.

## Contents of the report
The final report includes a univariate regression analysis table and a multivariate analysis table, 
which was generated using significant variables. The coefficients from each analysis are presented as bar plots

## Analysis process
1. Run code/00_clean_data.R
This script cleans and processes the raw data. (output: output/data_clean.rds)

2. Run code/01_make_report.R
This script generates additional derived outputs or computations used in the final report (e.g., summary statistics tables).
(output: output/table_one.rds)

3. Run code/02_make_table.R
This script creates a specific plot or table, such as plot1.png or other descriptive figures.(output: output/plot1.png).

4. Run code/03_make_table_2.R
This script creates another plot, such as plot2.png, or additional tables for the final report.(output: output/plot2.png).

4. Run code/04_render_rmd.R
This script renders the final R Markdown file (Final_project.Rmd) into an HTML document.(output:  Final_project.html).

## Quick Guide for generating the final report
Just run make in the terminal!