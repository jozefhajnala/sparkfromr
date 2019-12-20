# Deploys the bookdown website by
# pulling a Docker image `image_name` from DockerHub
# then creating a container called `sparkfromr_deploy`
# and running render_book() within the container
# rendered outputs are placed into `dir_target` and git committed
# the container is removed afterwards

# Variables
container_name=sparkfromr_deploy
image_name=jozefhajnala/sparkfromr:latest

# Directories
script_dir=$(dirname $(readlink -f "$0")) # This script is here
dir_root=$script_dir/../          # Bookdown sources are here
dir_target=$SPARKFROMR_DIR_TARGET # Rendered output will be copied here

# Pull the image and start container
docker pull $image_name
docker run -i -d \
  --name $container_name \
  --workdir /root/r/sparkfromr \
  $image_name \
  bash

# Copy sources to the container
docker cp $dir_root $container_name:/root/r/

# Run render_book
docker exec $container_name \
  Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'

# Copy rendered htmls from container to target
rm $dir_target/*.html
docker cp \
  $container_name:/root/r/sparkfromr/_output/. \
  $dir_target

# Stop and remove container
docker stop $container_name | xargs docker rm

# Git commit the rendered outputs (not pushing yet)
cd $dir_target
git status
git add -A
git status
git commit -m "Deploy automatically"
git status