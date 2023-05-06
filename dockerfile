FROM debian:latest

# Update and install Apache web server
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Install Node.js and NPM
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

