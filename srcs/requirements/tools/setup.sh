#!/bin/bash
ENV_DIR=$1

source ${ENV_DIR}/.env

if grep ${DOMAIN_NAME} /etc/hosts; then
    echo "/etc/hosts is already configured"
else
    if ! echo "127.0.0.1    ${DOMAIN_NAME}" >> /etc/hosts; then
        echo "/etc/hosts configuration failed. 'sudo' maybe needed."
        exit 1
    fi
fi

CERTS_DIR=${ENV_DIR}/requirements/nginx/${CERTS}
if [ -d ${CERTS_DIR} ]; then
    echo "certificates are already configured"
else
    mkdir ${CERTS_DIR}
    openssl genrsa 2048 > ${CERTS_DIR}/server.key
    openssl req \
        -subj "/C=JP/ST=Tokyo/L=Hoge/O=Fuga/OU=Piyo/CN=${DOMAIN_NAME}" \
        -new -key ${CERTS_DIR}/server.key \
        > ${CERTS_DIR}/server.csr
    openssl x509 -days 3650 -req -sha256 -signkey ${CERTS_DIR}/server.key \
        < ${CERTS_DIR}/server.csr \
        > ${CERTS_DIR}/server.crt
fi
