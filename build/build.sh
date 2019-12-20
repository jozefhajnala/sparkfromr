#!/bin/sh

rm _output/* -r
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
cp static/js _output/static -r
