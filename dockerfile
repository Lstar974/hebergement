FROM debian:11

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    unzip \
    curl \
    xvfb \
    chromium \
    chromium-driver

# Install Selenium
RUN pip3 install selenium

# Copy test script
COPY test_selenium.py /var/lib/jenkins/workspace/DevOps/test_selenium.py

# Expose port 80
EXPOSE 80
