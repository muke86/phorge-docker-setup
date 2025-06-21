#!/bin/bash

# Warte auf die DB (max 30s)
if [ ! -z "$MYSQL_HOST" ]; then
  echo "Warte auf Datenbank..."
  for i in {1..30}; do
    if mysqladmin ping -h"$MYSQL_HOST" --silent; then
      break
    fi
    sleep 1
  done
fi

# Storage/DB-Migration (harmlos, läuft idempotent)
./bin/storage upgrade --force

# Setze Datenbank-Konfiguration (wird bei jedem Start geprüft/überschrieben)
./bin/config set mysql.host "$MYSQL_HOST"
./bin/config set mysql.port "$MYSQL_PORT"
./bin/config set mysql.user "$MYSQL_USER"
./bin/config set mysql.pass "$MYSQL_PASSWORD"

# Setze BASE-URI, wenn explizit angegeben (kann sonst später via CLI gesetzt werden)
if [ ! -z "$PHORGE_BASE_URI" ]; then
  ./bin/config set phabricator.base-uri "$PHORGE_BASE_URI"
fi

# Apache starten
apache2-foreground
