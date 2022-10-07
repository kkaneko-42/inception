# nginx
FROM alpine:3.16

COPY ./conf/default.conf /etc/nginx/http.d/
COPY ./tools/kkaneko.42.fr/ /var/www/kkaneko.42.fr/
CMD ["rm", "-f", "/etc/nginx/http.d/default.conf"]
RUN ["apk", "--no-cache", "add", "nginx"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
