FROM debian:11
RUN apt -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && apt install -y nginx
ARG CERTS
COPY ${CERTS} /etc/nginx/ssl
COPY ./conf/default.conf /etc/nginx/conf.d/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
