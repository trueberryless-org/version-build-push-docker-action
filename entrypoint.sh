#!/bin/sh -l

# Read inputs from environment variables
IMAGE_NAME=$1
REGISTRY=$2
DOCKER_USERNAME=$3
DOCKER_PASSWORD=$4

# Get the latest semantic version numbers (major, minor, patch) from the docker registry image
CURRENT_VERSION=$(docker pull $REGISTRY/$IMAGE_NAME | grep -oP "(?<=${REGISTRY}/${IMAGE_NAME}:)\d+\.\d+\.\d+")

# Parse the version components
MAJOR_VERSION=$(echo $CURRENT_VERSION | cut -d '.' -f 1)
MINOR_VERSION=$(echo $CURRENT_VERSION | cut -d '.' -f 2)
PATCH_VERSION=$(echo $CURRENT_VERSION | cut -d '.' -f 3)

# Increment the patch version
PATCH_VERSION=$((PATCH_VERSION + 1))

# Set outputs
echo "version=v$MAJOR_VERSION.$MINOR_VERSION.$PATCH_VERSION" >> "$GITHUB_ENV"
echo "version-major=$MAJOR_VERSION" >> "$GITHUB_ENV"
echo "version-minor=$MINOR_VERSION" >> "$GITHUB_ENV"
echo "version-patch=$PATCH_VERSION" >> "$GITHUB_ENV"

# Checkout the original repo
git clone https://github.com/your-username/your-repo.git
cd your-repo

# Build a docker image and push it to the registry with the new patch version
docker build -t $REGISTRY/$IMAGE_NAME:v$MAJOR_VERSION.$MINOR_VERSION.$PATCH_VERSION .
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $REGISTRY
docker push $REGISTRY/$IMAGE_NAME:v$MAJOR_VERSION.$MINOR_VERSION.$PATCH_VERSION

