#!/bin/sh

# Remove logs older than 7 days
find /app/logs -type f -mtime +7 -exec rm -f {} \;

# Wipe cron
crontab -r

# Set cron
echo "Using CRON_SCHEDULE: ${CRON_SCHEDULE}"
echo "Full cron schedule: ${CRON_SCHEDULE} autoremove-torrents --conf=/app/config.yml --log=/app/logs"
mkdir -p /etc/cron.d
echo "${CRON_SCHEDULE} autoremove-torrents --conf=/app/config.yml --log=/app/logs" > /etc/cron.d/autoremove-torrents
crontab /etc/cron.d/autoremove-torrents
/usr/sbin/crond -f -l 8
