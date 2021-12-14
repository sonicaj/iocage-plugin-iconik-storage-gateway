#!/bin/sh

config_file="/usr/local/cantemo/iconik_storage_gateway/config.ini"
backup_config="/tmp/credentials_backup"

rm -f "$backup_config"

for key in "app-id" "storage-id" "auth-token"; do
	v=$(sed -n "s/.*$key *= *\([^ ]*.*\)/\1/p" < "$config_file")
	echo "$key = $v" >> "$backup_config"
done
