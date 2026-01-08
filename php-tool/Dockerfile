FROM php:8.4-cli-alpine

ARG COMPOSER_PACKAGE

COPY --from=composer:2.9.3 /usr/bin/composer /usr/local/bin/composer

RUN apk update --no-cache && apk upgrade --no-cache && apk add jq && rm -rf /var/cache/apk/*

RUN composer global require --dev ${COMPOSER_PACKAGE} && \
    composer clear-cache

ENV PATH="/root/.composer/vendor/bin:${PATH}"
