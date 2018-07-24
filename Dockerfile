FROM alpine:edge

MAINTAINER Chuanjian Wang <chuanjian@funxdata.com>

RUN addgroup -S www \
	adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G www www

RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing \
	bash \
	nginx \
	php7 \
	php7-common \
	php7-fpm \
	php7-mysqli \
	php7-redis \
	php7-pgsql \
	php7-openssl \
	php7-iconv \
	php7-protobuf \
	php7-uuid \
	php7-oauth \
	php7-mcrypt \
	supervisor

ADD etc/supervisord.conf /etc/supervisord.conf
ADD etc/fpm-www.conf /etc/php7/php-fpm.d/www.conf
ADD etc/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /run/nginx

CMD ["supervisord"]
