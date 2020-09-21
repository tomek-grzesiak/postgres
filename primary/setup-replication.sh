#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER replicator
    WITH REPLICATION
    ENCRYPTED PASSWORD 'replicator';
     
    ALTER SYSTEM SET wal_level TO 'hot_standby';
    ALTER SYSTEM SET archive_mode TO 'ON';
    ALTER SYSTEM SET max_wal_senders TO '5';
    ALTER SYSTEM SET wal_keep_segments TO '10';
    ALTER SYSTEM SET listen_addresses TO '*';
    ALTER SYSTEM SET hot_standby TO 'ON';
    ALTER SYSTEM SET archive_command TO 'test ! -f /mnt/server/archivedir/%f && cp %p /mnt/server/archivedir/%f';

EOSQL

