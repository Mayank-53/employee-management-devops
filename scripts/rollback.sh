#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: ./rollback.sh <commit>"
  exit 1
fi

git checkout "$1"

docker compose up -d --build

echo "Rollback completed"
