#!/bin/bash

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

docker tag employee-management-backend:latest \
employee-management-backend:backup-$TIMESTAMP

docker tag employee-management-frontend:latest \
employee-management-frontend:backup-$TIMESTAMP

echo "Images tagged successfully"
