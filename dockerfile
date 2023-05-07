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

RUN wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/93.0.4577.63/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver


# Copy test script
COPY test_selenium.py /var/lib/jenkins/workspace/DevOps/test_selenium.py

# Expose port 80
EXPOSE 80
