FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD=root
ADD ./env/my.cnf /etc/mysql/conf.d/my.cnf

COPY 01_init_db.sql /docker-entrypoint-initdb.d/01_init_db.sql
COPY 02_insert_data.sql /docker-entrypoint-initdb.d/02_insert_data.sql

RUN chmod 644 /etc/mysql/conf.d/my.cnf
