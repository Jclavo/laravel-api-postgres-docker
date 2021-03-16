FROM composer

FROM php:7.4-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer /usr/bin/composer /usr/bin/composer

# XDEBUG
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.9.2 \
    && docker-php-ext-enable xdebug

# set working directory
WORKDIR /var/www/html

# copy code
COPY ./src /var/www/html

# install ionic and then npm dependecies from json
RUN composer install --ignore-platform-reqs

# add group and user
RUN addgroup -g 1000 laravel-group
RUN adduser -u 1000 -G laravel-group -h /home/laravel-user -D laravel-user
RUN chown -R laravel-user:laravel-group /var/www/html
RUN chown -R laravel-user:laravel-group /var/log
USER laravel-user
