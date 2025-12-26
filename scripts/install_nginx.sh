#!/bin/bash
yum update -y
yum install nginx -y
systemctl start nginx
systemctl enable nginx

echo "<h1>Hello from DevOps T2 Micro Project</h1>" > /usr/share/nginx/html/index.html

