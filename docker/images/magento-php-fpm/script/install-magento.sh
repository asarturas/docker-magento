#!/bin/bash

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOSTNAME -e "create database $MYSQL_DATABASE"

cd public
n98-magerun install \
    --magentoVersion=magento-mirror-1.9.1.0 \
    --installationFolder=. --dbHost=$MYSQL_HOSTNAME \
    --dbUser=$MYSQL_USER \
    --dbPass=$MYSQL_PASSWORD \
    --dbName=$MYSQL_DATABASE \
    --installSampleData=false \
    --useDefaultConfigParams=yes \
    --baseUrl=http://$APP_HOSTNAME
cd ..

composer install
