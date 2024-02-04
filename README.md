# Usage

## Minimal

```yaml 
on: [push]

jobs:
  build-push-docker:
    runs-on: ubuntu-latest
    name: Build and push docker image to docker hub
    steps:
      - id: build-and-push-to-docker-hub
        uses: trueberryless-org/build-and-push-to-docker-hub@main
        with:
          IMAGE_NAME: trueberryless/mutanuq
          DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
```
