#!/bin/bash
export GIT_VERSION=$(git describe --tags | sed s/v//)
docker-compose build
docker tag $USER/rstudio:latest $USER/rstudio:$GIT_VERSION
docker tag $USER/rstudio-finance:latest $USER/rstudio-finance:$GIT_VERSION
docker tag $USER/rstudio-text:latest $USER/rstudio-text:$GIT_VERSION
docker system prune -f
