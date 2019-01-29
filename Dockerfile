FROM php:7.2-apache
RUN apt-get update \
    && apt-get -y install \
            libicu-dev \
            libjpeg-dev \
            libjpeg62-turbo-dev \
		    libpng-dev \
            libfreetype6-dev \
            imagemagick \
            libmagickwand-dev \
            # Required by composer
            git \
            zlib1g-dev \
        --no-install-recommends
    # Required extension
RUN docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install -j$(nproc) opcache \
    && pecl install apcu-5.1.8 imagick \
    && docker-php-ext-enable apcu imagick
    # Required by composer
RUN docker-php-ext-install -j$(nproc) zip

    # Cleanup to keep the images size small
RUN apt-get purge -y \
        icu-devtools \
        libicu-dev \
        libpng-dev \
        zlib1g-dev \
        libfreetype6-dev \
        libmagickwand-dev \
        libjpeg-dev \
        libjpeg62-turbo-dev \
    && apt-get autoremove -y \
    && rm -r /var/lib/apt/lists/*
RUN a2enmod rewrite
COPY config/php.ini /usr/local/etc/php/