FROM debian:latest

# Update and install Apache web server
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
