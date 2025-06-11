ARG PHP_VERSION=8.2

ARG XDEBUG_VERSION=3.4.3

FROM php:${PHP_VERSION}-cli-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apk update --no-cache \
  && apk upgrade --no-cache \
    && install-php-extensions \
        bcmath \
        gd \
        imagick \
        imap \
        intl \
        mongodb \
        mysqli \
        opcache \
        pcntl \
        pcov \
        pdo_mysql \
        redis \
        soap \
        xhprof \
        xdebug-$XDEBUG_VERSION \
        xml \
        zip \
    && rm -rf /var/cache/apk/*

RUN echo "pcov.enabled=1" >> /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini

COPY --from=composer:2.8.9 /usr/bin/composer /usr/local/bin/composer

ENV PATH="/root/.composer/vendor/bin:${PATH}"

RUN composer global require --dev \
    driftingly/rector-laravel \
    larastan/larastan \
    laravel/pint \
    phpstan/phpstan \
    phpstan/phpstan-mockery \
    phpstan/phpstan-phpunit \
    rector/rector \
    || exit 0
