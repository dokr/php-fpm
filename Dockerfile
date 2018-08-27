FROM alpine:edge

MAINTAINER Chuanjian Wang <chuanjian@funxdata.com>

ENV TZ=Asia/Shanghai
RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing \
	ca-certificates \
	tzdata \
	bash \
	nginx \
	php7 \
	php7-common \
	php7-ctype \
	php7-curl \
	php7-fpm \
	php7-iconv \
	php7-json \
	php7-mcrypt \
	php7-mysqli \
	php7-oauth \
	php7-openssl \
	php7-pgsql \
	php7-protobuf \
	php7-pdo \
	php7-pdo_dblib \
	php7-pdo_mysql \
	php7-pdo_pgsql \
	php7-redis \
	php7-uuid \
	php7-xml \
	php7-xsl \
	composer \
	supervisor

ADD etc/supervisord.conf /etc/supervisord.conf
ADD etc/fpm-www.conf /etc/php7/php-fpm.d/www.conf
ADD etc/nginx.conf /etc/nginx/nginx.conf
ADD etc/php-fpm.conf /etc/php7/php-fpm.conf 

RUN mkdir /run/nginx

CMD ["supervisord"]
