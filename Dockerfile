FROM nginx:alpine

MAINTAINER Oleg Kulik "okulik@gorillagroup.com"

RUN apk add --virtual .build-deps \
    shadow \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted \
    && usermod -u 1000 nginx \
    && groupmod -g 1000 nginx \
    && apk del .build-deps
