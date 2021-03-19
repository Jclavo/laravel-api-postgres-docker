# tips

wait until the container state will be healthy

Open a shell in the container

- docker exec -it [container-name] bash

Connect to postgres

- psql -U [user-name]
- psql -U postgres

change your password

- ALTER USER [user-name] WITH PASSWORD '[new-password]';

create a database

- bash > createdb -U [user-name] [database-name]

Connect to specific database 
- bash > psql -U [user-name] [database-name]

List database 

- #> \l

List tables 

- #> \d

change database

- #> \c [database-name]


