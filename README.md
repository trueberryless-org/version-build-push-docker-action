# Build and push docker images with versioning action

This action simply takes some inputs (Dockerfile in root dir of repo, image name and docker credentials) and publishes a new docker image on the registry every time you include some form of `version` in your commit message.

## Workflow

When writing the commit message, remember to include a second message with three posible options:

```bash
git commit -m "some changes" -m "version-patch"
git commit -m "heavy changes" -m "version-minor"
git commit -m "damn changes" -m "version-major"
```

You need not to write it exactly this way, as long as the word `version` and the additional semantic versioning level is included (`major`, `minor` or `patch`).

## Usage

### Minimal usage

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

### Optimal usage

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

When you trigger the action by workflow dispatch (by manually clicking `run action` in the actions tab), it automatically creates a `patch` version.
