#!/usr/bin/env bash
#
# Script para hacer pull de un repositorio
# parameters: repositorio 
# por ejemplo ./only_pull.sh telco-modules

repository=$1

CD="/odoo_ar/odoo-15.0e/canal2/sources"

sudo cd "$CD/$repository"
echo "***** actualizando repositorio $repository ******"
git pull
echo "***** reiniciando servidor ******"
python3 /home/grivero/multi_client_mgr/multi.py -s -r -c canal2
