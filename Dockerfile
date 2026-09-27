FROM jrottenberg/ffmpeg:9.0-scratch AS ffmpeg

FROM debian:trixie-slim

ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64

RUN apt update && \
	apt install -y git && \
	apt clean -y && \
	apt autoclean -y && \
	apt autoremove -y && \
	rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

COPY --from=ffmpeg /bin/ffmpeg /bin/ffprobe /usr/local/bin/
COPY --from=ffmpeg /lib /lib
COPY --from=ffmpeg /share /share

# COPY ./app /app

CMD ["/bin/bash"]

