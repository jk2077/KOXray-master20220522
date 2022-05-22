FROM alpine:edge

ARG AUUID="f8b73860-3d7a-4d0b-86a5-4e49d0745806"
ARG CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ARG ParameterSSENCYPT="KOXray-master20220522"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
