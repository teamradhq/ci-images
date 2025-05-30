ARG PHP_VERSION=8.2

FROM php:${PHP_VERSION}-cli-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apk update --no-cache && apk upgrade --no-cache \
    && install-php-extensions bcmath intl pcov pdo_mysql soap xml \
    && rm -rf /var/cache/apk/*

RUN echo "extension=pcov.so" >> /usr/local/etc/php/php.ini

RUN echo "pcov.enabled=1" >> /usr/local/etc/php/php.ini

COPY --from=composer:2.8.9 /usr/bin/composer /usr/local/bin/composer
