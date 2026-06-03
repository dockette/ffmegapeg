# AGENTS.md

## Project

Dockette FFMEGAPEG demonstrates and packages ffmpeg tooling copied from `jrottenberg/ffmpeg:7.1-scratch` into a Debian runtime image.

## Image

- Image name is `dockette/ffmegapeg`.
- Default tag is `latest`, controlled by `DOCKER_TAG`.
- Build context is the repository root.
- `Dockerfile` copies `ffmpeg`, `ffprobe`, `/lib`, and `/share` from the ffmpeg stage into `debian:bookworm-slim`.
- `LD_LIBRARY_PATH` is set to `/usr/local/lib:/usr/local/lib64` for the copied ffmpeg libraries.
- The runtime image installs `git` and defaults to `/bin/bash`.

## Commands

- `make build` uses Docker Buildx for `${DOCKER_PLATFORMS}` and tags `${DOCKER_IMAGE}:${DOCKER_TAG}`.
- `make test` runs `ffmpeg -version` and `ffprobe -version` inside the image.
- `make run` opens an interactive container shell.

## Runtime Notes

- No Compose file is present; local runtime is direct `docker run`.
- Default Makefile platforms are `linux/amd64,linux/arm64`; add `--load` or narrow platforms manually if you need a locally runnable image from `make build`.
- GitHub Actions builds context `.` and publishes `dockette/ffmegapeg:latest` after the smoke test.
- README shows the intended pattern for copying ffmpeg into other images; keep it aligned with the Dockerfile stage source.

## Guidelines

- Keep `README.md`, `Makefile`, `Dockerfile`, and `.github/workflows/docker.yml` aligned when changing ffmpeg source image, platforms, or runtime dependencies.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Keep README badges and maintenance sections consistent with other Dockette image repos.
- Do not introduce unrelated formatting or structural changes.
