#!/bin/sh

echo "$CRON /app/wol-script" >> /var/spool/cron/crontabs/root
/usr/sbin/crond -f -l 2 -L /dev/stdout
