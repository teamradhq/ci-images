FROM michaelcooper/pulse:gitlab-runner-app-php82

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN && install-php-extensions pcov

RUN echo "pcov.enabled=1" >> /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini
RUN echo "extension=pcov.so" > /usr/local/etc/php/conf.d/docker-php-ext-pcov.ini

COPY --from=composer:2.9.2 /usr/bin/composer /usr/local/bin/composer
