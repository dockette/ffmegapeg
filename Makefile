DOCKER_IMAGE=dockette/ffmegapeg
DOCKER_PLATFORM=linux/amd64

.PHONY: docker-build
docker-build:
	docker buildx \
		build \
		--platform ${DOCKER_PLATFORM} \
		--pull \
		-t ${DOCKER_IMAGE} \
		.
