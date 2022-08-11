#!/usr/bin/env bash
#######################################################################
# Restore newest backup from production to local deactivating database.
# parameters: client version
# por ejemplo ./restore_database.sh odoo13 13.0 polyseed_prod polyseed_sync

client=$1
version=$2
subclient=$3
db=$4
# odoo11 11.0 geminis

dir="/odoo_ar/odoo-"$version/$client
bkp=$dir"/backup_dir/"$subclient
echo $bkp

# restorear el backup mas nuevo que encuentre
sudo docker run --rm -i \
    --link "pg-"$client":db" \
    -v $bkp/:/backup \
    -v $dir/data_dir/filestore:/filestore \
    --env NEW_DBNAME=$db \
    --env DEACTIVATE=True \
    regaby/dbtools:1.3.0

