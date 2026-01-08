FROM php:8.4-cli-alpine

COPY --from=composer:2.9.3 /usr/bin/composer /usr/local/bin/composer

RUN apk update --no-cache && apk upgrade --no-cache && rm -rf /var/cache/apk/*

RUN composer global require --dev rector/rector driftingly/rector-laravel

RUN composer clear-cache

ENV PATH="/root/.composer/vendor/bin:${PATH}"
