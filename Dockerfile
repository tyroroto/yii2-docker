FROM php:7.0-apache
# COPY config/php.ini /usr/local/etc/php/

RUN apt-get update \
    && apt-get -y install \
            libicu52 \
            libicu-dev \

            # Required by composer
            git \
            zlib1g-dev \
        --no-install-recommends \

    # Required extension
    && docker-php-ext-install -j$(nproc) intl \

    # Additional common extensions
    && docker-php-ext-install -j$(nproc) opcache \
    && pecl install apcu-5.1.8 && docker-php-ext-enable apcu \

    # Required by composer
    && docker-php-ext-install -j$(nproc) zip \

    && docker-php-ext-install pdo pdo_mysql \

    # Cleanup to keep the images size small
    && apt-get purge -y \
        icu-devtools \
        libicu-dev \
        zlib1g-dev \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/*

RUN a2enmod rewrite
COPY config/php.ini /usr/local/etc/php/
RUN chmod -R 777 /var/www


ADD app-config.conf /etc/apache2/sites-enabled/000-default.conf