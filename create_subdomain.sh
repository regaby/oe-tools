
#!/usr/bin/env bash
#######################################################################
# create apache subdomain
# parameters: subdomain
# example ./create_subdomain.sh geminis.ntsystemwork.com.ar geminis
url=$1
client=$2
file=$1".conf"
db=$2"_prod"

echo $url
echo $client
echo $file

cd /etc/apache2/sites-available/
sudo touch $file
sudo echo '<VirtualHost *:80>
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
RequestHeader set X-Odoo-dbfilter "'$db'"
</VirtualHost>'>"/etc/apache2/sites-available/"$file

sudo a2ensite $file
sudo systemctl reload apache2
