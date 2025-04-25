FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y libcurl4-openssl-dev libxml2-dev pandoc

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
COPY code code
COPY Makefile .
COPY Final_project.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv 
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt = FALSE)"

RUN mkdir final_report

CMD make && mv Final_project.html final_report