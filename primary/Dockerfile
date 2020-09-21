FROM docker.io/library/postgres:10.6
COPY setup-replication.sh /docker-entrypoint-initdb.d/setup-replication.sh
RUN mkdir -p /mnt/server/archivedir/
RUN chown postgres:postgres /mnt/server/archivedir

