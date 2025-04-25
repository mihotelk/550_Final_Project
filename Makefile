Final_project.html: code/04_render_rmd.R Final_project.Rmd output/data_clean.rds output/plot1.png output/plot2.png output/table_one.rds
	Rscript code/04_render_rmd.R

output/data_clean.rds: code/00_clean_data.R
	Rscript code/00_clean_data.R

output/plot1.png: code/02_make_table.R output/data_clean.rds
	Rscript code/02_make_table.R

output/plot2.png: code/03_make_table_2.R output/data_clean.rds
	Rscript code/03_make_table_2.R

output/table_one.rds: code/01_make_report.R output/data_clean.rds
	Rscript code/01_make_report.R
	
install:
	Rscript -e "renv::restore()"

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html

# Docker-associated rules (run on our local machine)
PROJECTFILES = report.Rmd code/01_make_output.R code/02_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# rule to build image
project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image .
	touch $@

# rule to build the report automatically in our container
final_report/report.html: project_image
	docker run -v "$$(pwd)/final_report":/project/final_report project_image