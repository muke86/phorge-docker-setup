#!/bin/bash

# Warte, bis die DB erreichbar ist (nur bei Docker Compose wichtig)
if [ ! -z "$MYSQL_HOST" ]; then
  echo "Warte auf Datenbank..."
  until mysqladmin ping -h"$MYSQL_HOST" --silent; do
    sleep 2
  done
fi

# Storage/DB-Migration (harmlos, läuft idempotent)
./bin/storage upgrade --force

# Apache starten (im Vordergrund)
apache2-foreground
