ARG PHP_VERSION=8.2

FROM php:${PHP_VERSION}-cli-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

COPY --from=composer:2.9.2 /usr/bin/composer /usr/local/bin/composer

RUN apk update --no-cache && apk upgrade --no-cache \
    && apk add aws-cli docker git jq nodejs npm \
    && install-php-extensions \
        bcmath \
        intl \
        pcov \
        pdo_mysql \
        soap \
        xml  \
        zip \
    && rm -rf /var/cache/apk/*

RUN echo "pcov.enabled=1" >> /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini

ENV PATH="/root/.composer/vendor/bin:${PATH}"
