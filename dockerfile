# Image de base
FROM debian:buster-slim

# Mettre à jour le système et installer les dépendances
RUN apt-get update && apt-get install -y \
      DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    curl \
    php7.4 \
    libapache2-mod-php7.4 \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-soap \
    php7.4-xml \
    php7.4-zip \
    git

# Cloner le référentiel Github
RUN git clone https://github.com/lstar974/site.git /var/www/html

# Activer le module Apache pour PHP 8.1
RUN a2enmod php8.1

# Exposer le port 80 pour le trafic HTTP
EXPOSE 80

# Démarrer le serveur Apache2
CMD /usr/sbin/apache2ctl -D FOREGROUND
