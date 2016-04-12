#!/bin/bash

cd /var/www/app/sample-data
if [ ! -f magento-sample-data-1.9.1.0.tar.gz ]; then
    curl -o magento-sample-data-1.9.1.0.tar.gz http://netix.dl.sourceforge.net/project/mageloads/assets/1.9.1.0/magento-sample-data-1.9.1.0.tar.gz
fi
if [ ! -d magento-sample-data-1.9.1.0 ]; then
    tar -xvzf magento-sample-data-1.9.1.0.tar.gz
fi
cd magento-sample-data-1.9.1.0/
cp -Rf media/* /var/www/app/public/media/
cp -Rf skin/* /var/www/app/public/skin/

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOSTNAME $MYSQL_DATABASE < magento_sample_data_for_1.9.1.0.sql

cd /var/www/app/public

n98-magerun config:set "web/unsecure/base_url" "http://$APP_HOSTNAME/"
n98-magerun config:set "web/secure/base_url" "http://$APP_HOSTNAME/"
n98-magerun config:set "dev/template/allow_symlink" 1
n98-magerun sy:se:ru
n98-magerun in:re:al
n98-magerun admin:user:create admin arturas@smorgun.lt admin123
n98-magerun admin:notifications
