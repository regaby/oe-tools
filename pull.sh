
#!/usr/bin/env bash
#
# Script para hacer pull de un repositorio
# parameters: repositorio 
# por ejemplo ./only_pull.sh nt-addons

repository=$1

CD="/odoo_ar/odoo-13.0/dck_blancoamor/sources"

cd "$CD/$repository"
echo "***** actualizando repositorio $repository ******"
git pull
echo "***** reiniciando servidor ******"
oe -s -r
