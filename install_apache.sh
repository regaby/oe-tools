#!/usr/bin/env bash
#######################################################################
# Install apache

apt install apache2
a2enmod proxy
a2enmod proxy_balancer
a2enmod proxy_html
a2enmod proxy_http
a2enmod proxy_http2
a2enmod headers
systemctl restart apache2
a2dissite /etc/apache2/sites-enabled/000-default.conf
systemctl reload apache2
# systemctl status apache2.service
# systemctl restart apache2
