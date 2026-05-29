ARG PHP_VERSION=8.4

ARG ALPINE_VERSION=alpine3.22

ARG COMPOSER_VERSION=2.9.8

ARG XDEBUG_VERSION=3.5.1

FROM composer:${COMPOSER_VERSION} AS composer_bin

FROM php:${PHP_VERSION}-cli-${ALPINE_VERSION}

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

COPY --from=composer_bin /usr/bin/composer /usr/local/bin/composer

RUN apk update --no-cache && apk upgrade --no-cache \
    && apk add aws-cli bash docker git jq nodejs npm sqlite \
    && install-php-extensions \
        bcmath \
        curl \
        dom\
        gd \
        intl \
        libxml \
        mbstring \
        pcntl \
        pcov \
        pdo \
        pdo_mysql \
        pdo_sqlite \
        soap \
        xdebug-${XDEBUG_VERSION} \
        xml  \
        zip \
    && rm -rf /var/cache/apk/*

RUN echo "xdebug.mode=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN echo "pcov.enabled=1" >> /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini

ENV PATH="/root/.composer/vendor/bin:${PATH}"
