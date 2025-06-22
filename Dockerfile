# Basis: Offiziell gepflegtes PHP 8.1 mit Apache
FROM php:8.1-apache

# System-Abhängigkeiten und PHP-Module installieren
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    mariadb-client \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mysqli gd intl zip opcache pcntl \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    apt-get install -y python3-pygments 


# Composer installieren
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Phorge klonen (immer Master, alternativ Tag verwenden)
# Phorge klonen
RUN git clone --depth=1 https://github.com/phorgeit/phorge.git /var/www/phorge
RUN git clone --depth=1 https://github.com/phorgeit/arcanist.git /var/www/arcanist
WORKDIR /var/www/phorge

COPY ./webroot/.htaccess /var/www/phorge/webroot/.htaccess
# Webroot setzen (Apache)

# Abhängigkeiten per Composer (Dauer: 1–2 Min)
#RUN composer install --no-dev --prefer-dist

# Apache-Konfig anpassen (mod_rewrite aktivieren, Pfad setzen)
RUN a2enmod rewrite
COPY ./phorge-apache.conf /etc/apache2/sites-available/000-default.conf

# Rechte setzen (wichtig für Logs/Uploads)
RUN chown -R www-data:www-data /var/www/phorge

# Startscript (Migration/Storage, dann Apache)
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
