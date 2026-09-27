<h1 align=center>Dockette / FFMEGAPEG</h1>

<p align=center>
    Examples of ffmpeg in Docker.
</p>

<p align=center>
   <a href="https://github.com/dockette/ffmegapeg/actions"><img src="https://github.com/dockette/ffmegapeg/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/ffmegapeg"><img src="https://img.shields.io/docker/pulls/dockette/ffmegapeg.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

-----

## Usage

```Dockerfile
FROM jrottenberg/ffmpeg:9.0-scratch AS ffmpeg

FROM debian:trixie-slim

ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64

RUN apt update && \
	apt install -y YOUR_DEPS && \
	apt clean -y && \
	apt autoclean -y && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

COPY --from=ffmpeg /bin/ffmpeg /bin/ffprobe /usr/local/bin/
COPY --from=ffmpeg /lib /lib
COPY --from=ffmpeg /share /share

COPY ./app /app

ENTRYPOINT ["/app"]
```

-----

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
