#!/bin/sh

mkdir -p /etc/nginx/certs

chown -R www-data:www-data /etc/nginx/certs

# traverse hosts
# if hosts are set
if [ ! -z $VIRTUAL_HOST ]
then
    IFS=',';
    for host in $VIRTUAL_HOST
    do
        if [ ! -f "/etc/nginx/certs/${host}.key" ]
        then
            # if key file does not exist create it
            openssl req \
                -x509 \
                -sha256 \
                -nodes \
                -days 365 \
                -newkey rsa:2048 \
                -subj "/C=US/ST=Illinois/L=Chicago/O=Dis/CN=${host}" \
                -keyout "/etc/nginx/certs/${host}.key" \
                -out "/etc/nginx/certs/${host}.crt"
        fi
    done
fi

exec "$@"
