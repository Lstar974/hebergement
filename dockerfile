# Image de base
FROM debian:buster-slim

# Mettre à jour le système et installer les dépendances
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    php8.1 \
    libapache2-mod-php8.1 \
    php8.1-mysql \
    php8.1-curl \
    php8.1-gd \
    php8.1-intl \
    php8.1-mbstring \
    php8.1-soap \
    php8.1-xml \
    php8.1-zip \
    git

# Cloner le référentiel Github
RUN git clone https://github.com/lstar974/site.git /var/www/html

# Activer le module Apache pour PHP 8.1
RUN a2enmod php8.1

# Exposer le port 80 pour le trafic HTTP
EXPOSE 80

# Démarrer le serveur Apache2
CMD /usr/sbin/apache2ctl -D FOREGROUND
