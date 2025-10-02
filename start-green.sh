#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo '<h1 style="color: white; background-color: #28a745; padding: 20px; text-align: center;">GREEN Environment</h1><p>Traffic Weight: ${green_weight}%</p>' > /var/www/html/index.html