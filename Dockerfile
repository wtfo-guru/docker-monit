#
# Dockerfile for monit
# original from: https://hub.docker.com/r/vimagick/monit/dockerfile

FROM alpine
MAINTAINER Quien Sabe <qs5779@mail.com>

RUN apk add --no-cache monit

COPY data /etc/monit

RUN set -xe \
    && chmod 600 /etc/monit/monitrc \
    && ln -sf /etc/monit/monitrc /etc/monitrc \
    && mkdir -p /var/lib/monit/events

VOLUME /etc/monit /var/lib/monit

EXPOSE 2812

CMD ["monit", "-Ic", "/etc/monitrc"]
