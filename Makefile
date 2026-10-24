DOCKER_IMAGE=dockette/ffmegapeg
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64
VERSION:=$(shell cat VERSION)

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
	@date -u +%Y.%m.%d > VERSION
	@echo "VERSION: ${VERSION} -> $$(cat VERSION)"
	@echo "next: git commit -am \"Release: $$(cat VERSION)\" && git push"
