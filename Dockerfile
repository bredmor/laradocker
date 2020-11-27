#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM ubuntu:latest

LABEL maintainer="Morgan Breden <morgan@bredenlabs.com>"

RUN DEBIAN_FRONTEND=noninteractive
RUN TZ=America/New_York
RUN apt-get clean && apt-get update -y && apt-get install -y locales
RUN locale-gen en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

# Add PHP7 PPA from ondrej
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ondrej/php

#
#--------------------------------------------------------------------------
# Software Installation
#--------------------------------------------------------------------------
#

RUN echo 'DPkg::options { "--force-confdef"; };' >> /etc/apt/apt.conf

# Install required software and common PHP extensions
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --allow-downgrades --allow-remove-essential \
        --allow-change-held-packages \
        php8.0-cli \
        php8.0-common \
        php8.0-curl \
        php8.0-intl \
        php8.0-xml \
        php8.0-mbstring \
        php8.0-mysql \
        php8.0-pgsql \
        php8.0-sqlite \
        php8.0-sqlite3 \
        php8.0-zip \
        php8.0-bcmath \
        php8.0-memcached \
        php8.0-gd \
        php8.0-dev \
	php8.0-calendar \
        php8.0-imagick \
        pkg-config \
        libcurl4-openssl-dev \
        libedit-dev \
        libssl-dev \
        libxml2-dev \
        xz-utils \
        libsqlite3-dev \
        sqlite3 \
        git \
        curl \
        vim \
        nano \
        postgresql-client \
        nodejs \
        openssh-client \
	zip \
       	unzip \
    && apt-get clean

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

# Source the bash
RUN . ~/.bashrc

# Install NPM
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh

# Setup composer vars
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH "/composer/vendor/bin:~/.local/bin:$PATH"

# Install prestissimo for paralell downloads & install Vapor CLI
RUN set -xe && \
        composer global require laravel/vapor-cli && \
        composer clear-cache
