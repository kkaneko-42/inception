FROM debian:11
RUN apt update && apt install -y nginx
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
