#!/usr/bin/env bash
#######################################################################
# create apache subdomain
# parameters: subdomain
# example ./create_domain.sh client.com.ar
url=$1
file=$1".conf"

echo $url
echo $file

cd /etc/apache2/sites-available/
touch $file
echo '<VirtualHost *:80>
  ServerName '$url'
  ProxyPass / http://127.0.0.1:8069/
  ProxyPassReverse / http://127.0.0.1:8069/ retry=10
  ProxyPassReverseCookieDomain / http://127.0.0.1:8069/
  ProxyPreserveHost On
  ProxyRequests Off
  ProxyTimeout 300
  RequestHeader set "X-Forwarded-Proto" expr=%{REQUEST_SCHEME}
  SetEnv proxy-nokeepalive
#<Location "/web/database/manager" >
#Order Deny,allow
#Deny from all
#</Location>
</VirtualHost>'>"/etc/apache2/sites-available/"$file

a2ensite $file
systemctl reload apache2
