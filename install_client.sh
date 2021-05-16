#!/usr/bin/env bash
#######################################################################
# Install odoo client with odoo-env
# parameters: github_user client
# example ./install_client.sh regaby jjm
github_user=$1
client=$2

# install_server.sh
cd ~
git clone "https://github.com/"$github_user"/cl-"$client".git"
cd "cl-"$client
## instalación del entorno
oe -i -c $client
## para levantar container de postgres
oe -R -c $client
## para escribir odoo.config
oe -w -c $client
## para levantar container de odoo
oe -r -c $client
