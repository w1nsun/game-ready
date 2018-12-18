FROM php:7.2-cli

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        && docker-php-ext-install -j$(nproc) iconv \
        && docker-php-ext-install pdo pdo_mysql \
        && docker-php-ext-enable pdo pdo_mysql \
        && docker-php-ext-install pcntl \
        && docker-php-ext-enable pcntl \
        && apt-get install -y zlib1g-dev libicu-dev g++ \
        && docker-php-ext-configure intl \
        && docker-php-ext-install intl \
        && docker-php-ext-enable intl

RUN mkdir 0777 /vendor \
    && mkdir -m 777 -p /var/www/current/vendor \
    && mkdir -m 777 -p /var/www/current/var/cache/dev \
    && mkdir -m 777 -p /var/www/current/var/log

WORKDIR /var/www/current
