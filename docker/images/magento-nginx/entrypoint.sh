#!/bin/bash

cp /shared-config/nginx.conf /etc/nginx/nginx.conf
sed "s/\$APP_HOSTNAME/$APP_HOSTNAME/g" /shared-config/app.conf > /etc/nginx/conf.d/app.conf

nginx -g "daemon off;"
