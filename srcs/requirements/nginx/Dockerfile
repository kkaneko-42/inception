FROM debian:11
RUN apt update && apt install -y nginx
ARG CERTS
COPY ${CERTS} /etc/nginx/ssl
COPY ./conf/default.conf /etc/nginx/conf.d/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
