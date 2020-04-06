FROM ubuntu

LABEL maintainer="Toni Corvera <outlyer@gmail.com>"

RUN apt-get update \
    && apt-get install --no-install-recommends -y revelation \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY=":0"

ENTRYPOINT [ "/usr/bin/dbus-run-session", "/usr/bin/revelation" ]
