#!/bin/sh
acmeFile="/root/.acme.sh/acme.sh"
nginxHttpConf="/etc/nginx/conf.d/http/"

if [ ! -f "$acmeFile" ]; then
    echo 'install acme'
    curl  https://get.acme.sh | sh \
    && sed -i 's#> /dev/null#>> /root/.acme.sh/acme.log#' /var/spool/cron/crontabs/root
fi

if [ ! -d "$nginxHttpConf" ]; then
    echo 'config nginx'
    mkdir -p /etc/nginx/conf.d/http /etc/nginx/conf.d/rtmp \
    && curl -fSL https://raw.githubusercontent.com/djin-cn/nginx/master/1.15.3/nginx.vh.default.conf -o /etc/nginx/conf.d/http/default.conf \
    && curl -fSL https://raw.githubusercontent.com/djin-cn/nginx/master/1.15.3/rtmp.conf -o /etc/nginx/conf.d/rtmp/rtmp.conf \
    && curl -fSL https://raw.githubusercontent.com/djin-cn/nginx/master/1.15.3/ssl.conf -o /etc/nginx/conf.d/http/ssl.conf
fi

crond

exec "$@"
