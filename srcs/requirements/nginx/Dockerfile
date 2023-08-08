FROM debian:11
RUN apt update && apt install -y nginx
COPY ${CERTS} /etc/nginx/ssl
COPY ./conf/ssl.conf /etc/nginx/conf.d/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
