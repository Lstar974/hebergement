FROM debian:latest

# Install dependencies
RUN apt-get update && apt-get install -y python3 python3-pip wget unzip curl xvfb chromium chromium-driver

# Install Selenium
RUN pip3 install selenium

# Add test script
ADD test_selenium.py /var/lib/jenkins/workspace/DevOps/test_selenium.py

# Expose port 80
EXPOSE 80

# Start web server
CMD ["python3", "-m", "http.server", "80"]


