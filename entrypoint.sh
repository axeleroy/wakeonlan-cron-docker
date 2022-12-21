#!/bin/sh

echo "$CRON /app/wol-script" >> /var/spool/cron/crontabs/root
: "${CRON_LOG_LEVEL:=8}"
/usr/sbin/crond -f -l $CRON_LOG_LEVEL -L /dev/stdout
