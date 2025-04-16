<h1 align=center>Dockette / FFMEGAPEG</h1>

<p align=center>
    Examples of ffmpeg in Docker.
</p>

<p align=center>
  <a href="https://bit.ly/ctteg"><img src="https://badgen.net/badge/support/gitter/cyan"></a>
  <a href="https://github.com/sponsors/f3l1x"><img src="https://badgen.net/badge/sponsor/donations/F96854"></a>
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

-----

## Usage

```Dockerfile
FROM jrottenberg/ffmpeg:7.1-scratch AS ffmpeg

FROM debian:bookworm-slim

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

Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Also thank you for using this package.
