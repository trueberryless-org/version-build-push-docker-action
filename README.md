# Usage

```
on: [push]

jobs:
  build-push-docker:
    runs-on: ubuntu-latest
    name: Build and push docker image to docker hub
    steps:
      - id: foo
        uses: trueberryless-org/build-and-push-to-docker-hub@main
        with:
          IMAGE_NAME: trueberryless/mutanuq
          REGISTRY: docker.io                                   # optional
          DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
```
