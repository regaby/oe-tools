cd ~
git clone https://github.com/regaby/cl-bulonera.git
cd cl-bulonera
## instalación del entorno
oe -i -c bulonera --debug
## para levantar container de postgres
oe -R 
## para escribir odoo.config
oe -w 
## para levantar container de odoo
oe -r 

## Hasta aca tenemos odoo corriendo en localhost:8069

# comando para bajar todos los contenedores
sd rmall
# Levanto el contenedor de postgres y odoo con:
oe -R -r
# comando para ver que contenedores están levantandos
sd ps
# cuando hago un cambio en un modulo y quiero reiniciar odoo:
oe -s -r

# Los modulos están en /
/odoo_ar/odoo-14.0/bulonera/sources

## copiarse los source del cliente:
# bajar el archivo bulonera_source.zip del drive compartido
# copiarlo en el directorios sources y descomprimirlo ahi
# luego editar el archivo odoo.conf ubicado en :
/odoo_ar/odoo-14.0/bulonera/config
# reemplazar el parámetro addons_path con lo siguiente:
addons_path = /opt/odoo/custom-addons/cl-bulonera,
    /opt/odoo/custom-addons/enterprise,
    /opt/odoo/custom-addons/bulonera_source,
    /opt/odoo/custom-addons/bulonera_source/odoo-argentina,
    /opt/odoo/custom-addons/bulonera_source/currency,
    /opt/odoo/custom-addons/bulonera_source/credit_limit,
    /opt/odoo/custom-addons/bulonera_source/credit_limit/oca_server_tools,
    /opt/odoo/custom-addons/bulonera_source/credit_limit/sale-workflow,
    /opt/odoo/custom-addons/bulonera_source/oca_web,
    /opt/odoo/custom-addons/bulonera_source/sale,
    /opt/odoo/custom-addons/bulonera_source/stock,
    /opt/odoo/custom-addons/bulonera_source/multi-company,
    /opt/odoo/custom-addons/bulonera_source/product,
    /opt/odoo/custom-addons/bulonera_source/brand,
    /opt/odoo/custom-addons/bulonera_source/exe_custom_reports_albaran_inherit,
    /opt/odoo/custom-addons/bulonera_source/CybroAddons,
    /opt/odoo/custom-addons/bulonera_source/odoo-argentina-withholding,
    /opt/odoo/custom-addons/bulonera_source/account_payment_group_custom,
    /opt/odoo/custom-addons/bulonera_source/exe_res_partner_custom,
    /opt/odoo/custom-addons/bulonera_source/exe_sale_order_custom,
    /opt/odoo/custom-addons/bulonera_source/stock_no_negative,
    /opt/odoo/custom-addons/bulonera_source/autovacuum_message_attachment-14.0.1.0.0/,
    /opt/odoo/custom-addons/bulonera_source/exe_repair_order_custom,
    /opt/odoo/custom-addons/bulonera_source/server-auth,
    /opt/odoo/custom-addons/bulonera_source/product-attribute,
    /opt/odoo/custom-addons/bulonera_source/stock-logistics-warehouse


## restaurar la base de datos
# bajarse el archivo test_2_2023-12-14_11-13-32.zip
# y ubicarlo en :
/odoo_ar/odoo-14.0/bulonera/backup_dir
# para restaurar ubicarse en la carpera oe-tools y ejecutar:
./restore_database3.sh bulonera 14.0 bulonera_test
# este comando creará una base llamada bulonera_test y allí se restaurará la base

## Para usar pgadmin
# dentro del directorio oe-tools ejecutar:
./pgadmin.sh bulonera
# luego ingresar a localhost:8080
credenciales:
usuario: odoo
contraseña: odoo
Una vez logueado hay que crearse un servidor llamado pg-bulonera
host: pg-bulonera
usuaurio y contraseña: odoo

## ejecutar querys para pasar base de ddatos a modo test:
UPDATE ir_cron SET active = FALSE;
UPDATE res_company SET company_registry = '27315710508', l10n_ar_afip_ws_environment='testing';
UPDATE res_partner SET vat = '27315710508' WHERE id IN (SELECT partner_id FROM res_company);
UPDATE delivery_carrier SET prod_environment=False;
DELETE FROM ir_mail_server;

## para debuguear en el codigo donde se quierar hacer un break point agregar el siguiente código:
import wdb;wdb.set_trace()
# reiniciar el servidor de odoo:
oe -s -r
# ejecutar la accion necesaria en odoo hasta que se tope con el break point
# entrar a localhost:1984 se mostrará una interface donde se puede debuguear el código.

