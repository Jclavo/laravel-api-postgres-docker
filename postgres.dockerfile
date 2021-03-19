FROM postgres:13.2-alpine

# add group and user
RUN addgroup -g 1000 postgres-group
RUN adduser -u 1000 -G postgres-group -h /home/postgres-user -D postgres-user

RUN chown -R postgres-user:postgres-group /var/lib/postgresql/data 
RUN chown -R postgres-user:postgres-group /var/run/postgresql

USER postgres-user
