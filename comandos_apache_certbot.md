## instalacion de certbot (SSL)


  163  sudo apt-get update
  164  sudo apt-get install software-properties-common
  165  sudo add-apt-repository universe
  166  sudo add-apt-repository ppa:certbot/certbot
  167  sudo apt-get update
  168  sudo apt-get install certbot python3-certbot-apache -y
  169  sudo certbot --apache
  regaby@gmail.com
  a agree
  y share mail
  1 select domain
  2 redirect
  170  sudo certbot renew --dry-run
  171  nano /etc/cron.d
  172  nano /etc/cron.d/certbot
