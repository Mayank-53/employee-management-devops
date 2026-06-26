#!/bin/bash

set -e

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mkdir -p /apps/backups

echo "Creating database backup..."

docker exec employee_db pg_dump \
-U employee_user \
employee_db \
> /apps/backups/db-$TIMESTAMP.sql

echo "Saving deployed commit..."

git rev-parse HEAD \
> /apps/backups/commit-$TIMESTAMP.txt

echo "Uploading database backup to S3..."

aws s3 cp \
/apps/backups/db-$TIMESTAMP.sql \
s3://employee-management-backups-mayank/

echo "Uploading commit backup to S3..."

aws s3 cp \
/apps/backups/commit-$TIMESTAMP.txt \
s3://employee-management-backups-mayank/

echo "Backup completed successfully"
