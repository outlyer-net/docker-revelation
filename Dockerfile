FROM ubuntu:18.04
# 18.04 is the last LTS version with Revelation in its archive

LABEL maintainer="Toni Corvera <outlyer@gmail.com>"

RUN apt-get update \
    && apt-get install --no-install-recommends -y revelation \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY=":0"

ENTRYPOINT [ "/usr/bin/dbus-run-session", "/usr/bin/revelation" ]
