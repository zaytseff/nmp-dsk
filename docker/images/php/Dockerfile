FROM php:7.2-fpm

LABEL maintainer = 'Alex Zaytseff <alex.zaytseff@gmail.com>'

ARG APP_ENV

RUN apt-get update && apt-get install -y --no-install-recommends \
  autoconf \
  build-essential \
  apt-utils \
  zlib1g-dev \
  libzip-dev \
  unzip \
  zip \
  libmagick++-dev \
  libmagickwand-dev \
  libpq-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libwebp-dev \ 
  libxpm-dev 

RUN docker-php-ext-configure gd \
  --with-png-dir=/usr/include/ \
  --with-jpeg-dir=/usr/include/ \
  --with-freetype-dir=/usr/include/

RUN docker-php-ext-configure zip --with-libzip
            
RUN docker-php-ext-install gd intl pdo_mysql pdo_pgsql mysqli zip

RUN docker-php-ext-install exif
RUN docker-php-ext-configure exif \
            --enable-exif

RUN pecl install imagick-3.4.3

RUN docker-php-ext-enable imagick

RUN if [ "${APP_ENV}" = "DEVELOPMENT" ]; \
    then \
      pecl install xdebug && docker-php-ext-enable xdebug; \
      \
      echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
      && echo "xdebug.remote_connect_back=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
      && echo "xdebug.extended_info=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
      && echo "xdebug.max_nesting_level=400" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
      && echo "xdebug.idekey=docker" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    fi 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clear package lists
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

CMD ["sh", "-c", "chmod +x /usr/local/bin/permission.sh && sh /usr/local/bin/permission.sh && php-fpm --nodaemonize"]

WORKDIR /var/www/html
