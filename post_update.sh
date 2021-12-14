#!/bin/sh

config_file="/usr/local/etc/cantemo/iconik_storage_gateway/config.ini"
backup_config="/tmp/credentials_backup"

if [ ! -f "$backup_config" ]; then
	echo "$backup_config configuration file not found"
	exit 1
fi

for key in "app-id" "storage-id" "auth-token"; do
	v=$(sed -n "s/.*$key *= *\([^ ]*.*\)/\1/p" < "$backup_config")
	sed -i -e "s/.*\($key\) *= *\([^ ]*.*\)/\1 = $v/g" "$config_file"
done
