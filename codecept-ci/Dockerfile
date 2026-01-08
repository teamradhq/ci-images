FROM michaelcooper/pulse:gitlab-runner-app-php82

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

COPY --from=composer:2.9.3 /usr/bin/composer /usr/local/bin/composer

RUN apt-get update \
    && apt-get upgrade -y \
    && install-php-extensions pcov \
    && apt-get clean

RUN echo "pcov.enabled=1" >> /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini \
    && echo "extension=pcov.so" > /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini
