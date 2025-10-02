#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo '<h1 style="color: white; background-color: #007bff; padding: 20px; text-align: center;">BLUE Environment</h1><p>Traffic Weight: ${blue_weight}%</p>' > /var/www/html/index.html