FROM php:5.5-fpm

MAINTAINER Arturas Smorgun "arturas@smorgun.lt"

RUN curl -sS https://getcomposer.org/installer | php && \
    mv ./composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    curl -o n98-magerun.phar http://files.magerun.net/n98-magerun-latest.phar && \
    mv ./n98-magerun.phar /usr/local/bin/n98-magerun && \
    chmod +x /usr/local/bin/n98-magerun

RUN apt-get update && \
    apt-get install -y git mysql-client libmcrypt-dev libpng-dev && \
    docker-php-ext-install mbstring pdo_mysql mcrypt gd zip && \
    usermod -u 1000 www-data

ADD config /shared-config
ADD script /shared-script
ADD entrypoint.sh /entrypoint.sh

RUN mkdir -p /etc/php5/fpm/pool.d && \
    cp /shared-config/php-fpm.conf /etc/php5/fpm/php-fpm.conf && \
    cp /shared-config/app.conf /etc/php5/fpm/pool.d/app.conf

ENV MYSQL_HOSTNAME=db \
    MYSQL_DATABASE=app \
    MYSQL_USER=app \
    MYSQL_PASSWORD=app \
    APP_HOSTNAME=app

VOLUME /var/www/app

WORKDIR /var/www/app

ENTRYPOINT /entrypoint.sh
