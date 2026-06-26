#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: ./restore.sh <backup-file.sql>"
  exit 1
fi

BACKUP_FILE=$1

echo "Restoring database..."

cat "$BACKUP_FILE" | docker exec -i employee_db \
psql -U employee_user -d employee_db

echo "Restore completed"
