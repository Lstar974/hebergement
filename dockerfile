# Image de base
FROM debian:buster-slim

# Mettre à jour le système et installer les dépendances
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    php7.3 \
    libapache2-mod-php7.3 \
    php7.3-mysql \
    php7.3-curl \
    php7.3-gd \
    php7.3-intl \
    php7.3-mbstring \
    php7.3-soap \
    php7.3-xml \
    php7.3-zip \
    git

# Cloner le référentiel Github
RUN git clone https://github.com/lstar974/site.git /var/www/html

# Activer le module Apache pour PHP 7.3
RUN a2enmod php7.3

# Exposer le port 80 pour le trafic HTTP
EXPOSE 80

# Démarrer le serveur Apache2
CMD /usr/sbin/apache2ctl -D FOREGROUND
