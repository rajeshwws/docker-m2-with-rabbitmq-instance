FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install software-properties-common \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y \
    && apt-get update \
    && apt-get -y install zip \
    && apt-get -y install unzip \
    && apt-get -y install git \
    && apt-get -y install nginx php7.3-fpm php7.3-mysql php7.3-gd php7.3-cli php7.3-curl \
    && apt-get -y install php7.3-mbstring php7.3-xml php7.3-intl php7.3-zip php7.3-soap \
    && apt-get -y install php7.3-bcmath php7.3-common php7.3-json php-pear php7.3-dev php7.3-opcache \
    && curl -o composer.php https://getcomposer.org/installer \
    && php composer.php --version=1.10.17 --install-dir=/usr/bin --filename=composer \
    && rm -r /var/lib/apt/lists/* && mkdir /run/php/