#!/bin/bash

bash /shared-script/install-magento.sh
bash /shared-script/install-sample-data.sh

php-fpm
