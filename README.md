# Usage

## Minimal usage

```yaml 
on: [push]

jobs:
  build-push-docker:
    runs-on: ubuntu-latest
    name: Build and push docker image to docker hub
    steps:
      - id: build-and-push-to-docker-hub
        uses: trueberryless-org/version-build-push-docker-action@main
        with:
          IMAGE_NAME: trueberryless/mutanuq
          DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
```

## Optimal usage

```yaml
name: Docker Image Push

on:
  push:
    branches: [main]
  merge_group:
  pull_request:
    branches: [main]
  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

env:
  IMAGE_NAME: trueberryless/mutanuq

jobs:
  build-push-docker:
    runs-on: ubuntu-latest
    name: Build and push docker image to docker hub
    steps:
      - id: build-and-push-to-docker-hub
        uses: trueberryless-org/version-build-push-docker-action@main
        with:
          IMAGE_NAME: ${{ env.IMAGE_NAME }}
          DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
```
