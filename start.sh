#!/bin/sh

mkdir -p /etc/nginx/certs

chown -R www-data:www-data /etc/nginx/certs

# if cert name is set
if [ -n "$CERT_NAME" ]
then
    if [ ! -f "/etc/nginx/certs/${CERT_NAME}.key" ]
    then
        # if key file does not exist create it
        openssl req \
            -x509 \
            -sha256 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -subj "/C=US/ST=Illinois/L=Chicago/O=Dis/CN=${CERT_NAME}" \
            -keyout "/etc/nginx/certs/${CERT_NAME}.key" \
            -out "/etc/nginx/certs/${CERT_NAME}.crt"
    fi
fi

exec "$@"
