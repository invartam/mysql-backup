#!/bin/sh

cat <<EOF > /etc/backup.conf
MYSQL_HOST=$MYSQL_HOST
MYSQL_PORT=$MYSQL_PORT
MYSQL_USER=$MYSQL_USER
MYSQL_PASS=$MYSQL_PASS
BACKUP_DB=$BACKUP_DB
INTERVAL=$INTERVAL
EOF

if [ ! -d /etc/periodic/$INTERVAL ]
then
  echo "[ERROR] Interval $INTERVAL does not exists"
  exit 255
fi
mv /etc/periodic/backup /etc/periodic/$INTERVAL/backup

exec crond -f -d 8
