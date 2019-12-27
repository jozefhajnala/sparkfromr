#!/bin/sh
set -e

container_name=sparkfromr_deploy
image_name=jozefhajnala/sparkfromr:latest
script_dir=$(dirname $(readlink -f "$0"))
dir_root=$script_dir/../

docker pull $image_name
docker run -i -d \
  --name $container_name \
  --workdir /root/r/sparkfromr \
  $image_name bash

docker cp $dir_root $container_name:/root/r/
  
docker exec $container_name \
  Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'

docker stop $container_name
