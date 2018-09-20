FROM registry.cn-beijing.aliyuncs.com/wa/php-fpm:1.0.8

MAINTAINER Chuanjian Wang <chuanjian@funxdata.com>

RUN apk add --update php7-xdebug wget

RUN wget http://phar.phpunit.cn/phpunit.phar -o /usr/local/bin/phpunit.phar \
	chmod +x /usr/local/bin/phpunit.phar
