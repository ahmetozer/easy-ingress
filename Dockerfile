FROM alpine

RUN apk add nginx openssl nginx-mod-http-headers-more

WORKDIR /srv
COPY . .
RUN mv nginx.conf /etc/nginx/nginx.conf ;\
mkdir -p /run/nginx/ ;\
$(addgroup -g 82 -S www-data || true ) &&\
$(adduser -u 82 -D -S -G www-data www-data || true) \
chmod +x /srv/docker_run.sh


CMD [ "/srv/docker_run.sh"]