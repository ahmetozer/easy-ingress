FROM alpine

RUN apk add nginx openssl

WORKDIR /srv
COPY . .
RUN mv nginx.conf /etc/nginx/nginx.conf ;\
mkdir -p /run/nginx/ ;\
$(addgroup -g 82 -S www-data || true ) &&\
$(adduser -u 82 -D -S -G www-data www-data || true) 


CMD [ "/srv/docker_run.sh"]