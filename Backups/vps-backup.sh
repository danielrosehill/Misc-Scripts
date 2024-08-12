#!/bin/bash

# Variables
BACKUP_DIR="/backup"
ARCHIVE_NAME="vps_backup_$(date +%F).tar.gz"
EXCLUDE_FILE="/tmp/backup_exclude.txt"

cat <<EOL > $EXCLUDE_FILE
# Exclude unnecessary files and directories
/proc/*
/sys/*
/dev/*
/run/*
/tmp/*
/mnt/*
/media/*
/lost+found
/var/cache/*
/var/tmp/*
/var/log/*
/var/run/*
/swapfile
EOL

mkdir -p $BACKUP_DIR

tar -cvpzf $BACKUP_DIR/$ARCHIVE_NAME --exclude-from=$EXCLUDE_FILE --one-file-system /

rm $EXCLUDE_FILE

echo "Backup completed: $BACKUP_DIR/$ARCHIVE_NAME"
