# build the custom postgres image

````shell
docker build -t postgres_pgaudit .
````

# run the postgres container with extensions enabled

````shell
docker run \
  -v "$(pwd)/postgres_data:/var/lib/postgresql/data" \
  -v "$(pwd)/postgres_logs:/logs" \
  -p 5433:5432 \
  -e POSTGRES_PASSWORD=postgres \
  --rm \
  --name postgres_pgaudit \
  postgres_pgaudit \
  -c shared_preload_libraries='pgaudit,pg_stat_statements'
````

````shell
docker run \
  -p 5433:5432 \
  -e POSTGRES_PASSWORD=postgres \
  --rm \
  --name postgres_pgaudit \
  postgres_pgaudit \
  -c shared_preload_libraries='pgaudit,pg_stat_statements' \
  -c pg_stat_statements.track=all
````

# pgaudit

https://github.com/pgaudit/pgaudit

````sql
CREATE EXTENSION pgaudit;
       
-- NONE, READ, WRITE, FUNCTION, ROLE, DDL, MISC, MISC_SET, ALL, default: NONE
set pgaudit.log = 'all';
SHOW pgaudit.log;
````

# pg_stat_statements

````sql
CREATE EXTENSION pg_stat_statements;

select * from pg_stat_statements;

````
