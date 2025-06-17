#!/bin/bash
sudo yum update -y
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
echo '<!DOCTYPE html><html><body><h1>Hello from AWS</h1></body></html>' > /usr/share/nginx/html/index.html
# Configure Nginx to listen on port 80