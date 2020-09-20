#!/bin/bash

shortSHA=$(echo "${GITHUB_SHA}" | cut -c1-7)
BASE_NAME="docker.pkg.github.com/${GITHUB_REPOSITORY}/app"
SHA_NAME="${BASE_NAME}:${shortSHA}"

echo ${GITHUB_TOKEN} | docker login -u ctso --password-stdin docker.pkg.github.com

# Build container
docker build -t ${SHA_NAME} -t ${BASE_NAME} -f Dockerfile .

# Publish
docker push ${BASE_NAME}
docker push ${SHA_NAME}
