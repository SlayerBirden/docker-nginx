FROM nginx:alpine

MAINTAINER Oleg Kulik "okulik@gorillagroup.com"

RUN adduser -D -u 1000 www-data \
    && sed -i -e "s/user.*nginx/user www-data/" /etc/nginx/nginx.conf
