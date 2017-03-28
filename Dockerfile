FROM php:7-apache

RUN apt-get update && apt-get upgrade -y && apt-get install git zip unzip zlib1g-dev -y

RUN docker-php-ext-install zip

# install Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# install node and NPM
RUN apt-get install python-software-properties -y
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install nodejs

# install Laravel
RUN composer global require "laravel/installer"
RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc 
