#!/bin/sh -l

# Read inputs from environment variables
IMAGE_NAME=$INPUT_image_name
REGISTRY=$INPUT_registry
DOCKER_USERNAME=$INPUT_docker_username
DOCKER_PASSWORD=$INPUT_docker_password

# Your Docker build and push logic here
# Use $IMAGE_NAME, $REGISTRY, $DOCKER_USERNAME, $DOCKER_PASSWORD as needed

# Assuming you determine the version during the build/push process
# Replace the following lines with your actual version determination logic
CURRENT_VERSION="v1.2.3"
MAJOR_VERSION="1"
MINOR_VERSION="2"
PATCH_VERSION=$IMAGE_NAME # test

# Set outputs
echo "current_version=$CURRENT_VERSION" >> "$GITHUB_ENV"
echo "major_version=$MAJOR_VERSION" >> "$GITHUB_ENV"
echo "minor_version=$MINOR_VERSION" >> "$GITHUB_ENV"
echo "patch_version=$PATCH_VERSION" >> "$GITHUB_ENV"

# #!/bin/bash

# IMAGE_NAME="trueberryless/chat"
# API_URL="https://registry.hub.docker.com/v2/repositories/$IMAGE_NAME/tags"

# TAGS=$(curl -s "$API_URL" | jq -r '.results[].name' 2>/dev/null)

# if [ -z "$TAGS" ]; then
#   echo "Error: Unable to fetch tags from Docker Hub."
#   exit 1
# fi

# extract_version_numbers() {
#   IFS='.' read -ra VERSION <<< "$1"
#   MAJOR_VERSION="${VERSION[0]}"
#   MINOR_VERSION="${VERSION[1]}"
#   PATCH_VERSION="${VERSION[2]}"
# }

# latest_version=""
# for TAG in $TAGS; do
#   if [[ $TAG =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
#     if [ -z "$latest_version" ] || version_gt "$TAG" "$latest_version"; then
#       latest_version="$TAG"
#     fi
#   fi
# done

# if [ -n "$latest_version" ]; then
#   extract_version_numbers "$latest_version"
#   echo "Latest version: Major $MAJOR_VERSION, Minor $MINOR_VERSION, Patch $PATCH_VERSION"
# else
#   echo "No latest versioned image found. Major 0, Minor 0, Patch 1"
# fi

# version_gt() {
#   test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"
# }

# echo "PATCH_VERSION=$PATCH_VERSION" >> $GITHUB_ENV
# echo "MINOR_VERSION=$MINOR_VERSION" >> $GITHUB_ENV
# echo "MAJOR_VERSION=$MAJOR_VERSION" >> $GITHUB_ENV
