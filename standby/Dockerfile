FROM docker.io/library/postgres:10.6
RUN mkdir -p /mnt/server/archivedir/
RUN chown postgres:postgres /mnt/server/archivedir
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

