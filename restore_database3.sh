#!/usr/bin/env bash
#######################################################################
# Restore newest backup from production to local deactivating database.
# parameters: client version
# por ejemplo ./restore_database3.sh jjm 13.0 jjm_test

client=$1
version=$2
db_name=$3

dir="/odoo_ar/odoo-"$version/$client
bkp=$dir"/backup_dir"
echo $bkp

# restorear el backup mas nuevo que encuentre
sudo docker run --rm -i \
    --link "pg-"$client":db" \
    -v $bkp/:/backup \
    -v $dir/data_dir/filestore:/filestore \
    --env NEW_DBNAME=$db_name \
    --env DEACTIVATE=True \
    jobiols/dbtools
