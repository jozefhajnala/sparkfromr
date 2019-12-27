#!/bin/sh
set -e

container_name=sparkfromr_deploy
dir_deploy=/root/sparkfromr_deployed

docker start $container_name

docker exec $container_name git config --global user.email "jozef.hajnala@gmail.com"
docker exec $container_name git config --global user.name "Auto deployment"
docker exec $container_name \
  git clone \
  https://$SPARKFROMR_DEPLOYED_GH_TOKEN@github.com/jozefhajnala/sparkfromr_deployed \
  $dir_deploy
docker exec --workdir $dir_deploy $container_name git status
docker exec $container_name cp /root/r/sparkfromr/_output/. $dir_deploy -r
docker exec --workdir $dir_deploy $container_name git status
docker exec --workdir $dir_deploy $container_name git add -A
docker exec --workdir $dir_deploy $container_name git status
docker exec --workdir $dir_deploy $container_name git commit --allow-empty -m "Deploy automatically"
docker exec --workdir $dir_deploy $container_name git status
docker exec --workdir $dir_deploy $container_name git push

docker stop $container_name | xargs docker rm
