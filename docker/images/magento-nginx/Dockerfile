FROM nginx

MAINTAINER Arturas Smorgun "arturas@smorgun.com"

ADD config /shared-config
ADD entrypoint.sh /entrypoint.sh

ENV APP_HOSTNAME=app

VOLUME /var/www/app

ENTRYPOINT /entrypoint.sh
