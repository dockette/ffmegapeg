DOCKER_IMAGE=dockette/ffmegapeg
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64

include VERSION

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} ffmpeg -version
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} ffprobe -version

.PHONY: run
run:
	docker run --rm -it ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@sed -i.bak "s/^VERSION=.*/VERSION=$$(date -u +%Y.%m.%d)/" VERSION && rm VERSION.bak
	@cat VERSION
