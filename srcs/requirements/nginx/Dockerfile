# nginx
FROM alpine:3.16

COPY ./conf/default.conf /etc/nginx/http.d/
RUN ["apk", "--no-cache", "add", "nginx"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
