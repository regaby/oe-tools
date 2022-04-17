#!/usr/bin/env bash
#
# Script para hacer pull de un repositorio
# parameters: repositorio 
# por ejemplo ./only_pull.sh telco-modules

repository=$1

CD="/odoo_ar/odoo-15.0e/canal2/sources"

cd "$CD/$repository"
echo "***** actualizando repositorio $repository ******"
git pull
echo "***** reiniciando servidor ******"
cd /home/grivero/multi_client_mgr/
python3 multi.py -s -r -c canal2
