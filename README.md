# Sources of [sparkfromr.com](https://sparkfromr.com)

![](https://github.com/jozefhajnala/sparkfromr/workflows/deploy/badge.svg)
[![Netlify Status](https://api.netlify.com/api/v1/badges/2a53af41-32fa-4148-80c4-6ac3ceb8bbbf/deploy-status)](https://app.netlify.com/sites/suspicious-nobel-df2e83/deploys)
![](https://img.shields.io/github/v/tag/jozefhajnala/sparkfromr.svg?label=release&sort=semver)

This repository contains the sources for the [sparkfromr.com](https://sparkfromr.com) bookdown site. 

- The R markdown content resides in `index.Rmd` and the `content` directory
- The rendering can be done automatically using `sh build/sparkfromr_render_test.sh`
- The Docker image used for the deployment can be [found in Docker Hub](https://hub.docker.com/repository/docker/jozefhajnala/sparkfromr), build from sources in the [GitHub repo](https://github.com/jozefhajnala/sparkfromr_docker)
- The rendered website is deployed from [GitHub](https://github.com/jozefhajnala/sparkfromr_deployed)