FROM php:7.2-fpm-alpine

RUN apk update && apk add \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        curl \
        && docker-php-ext-install -j$(nproc) iconv \
        && docker-php-ext-install pdo pdo_mysql \
        && docker-php-ext-install pcntl \
        && apk add zlib-dev icu-dev g++ \
        && docker-php-ext-configure intl \
        && docker-php-ext-install intl \
        && docker-php-ext-enable intl \
        && rm -rf /var/cache/apk/*

RUN mkdir 0777 /vendor \
    && mkdir -m 777 -p /var/www/current/vendor \
    && mkdir -m 777 -p /var/www/current/var/cache/dev \
    && mkdir -m 777 -p /var/www/current/var/log

COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

WORKDIR /var/www/current