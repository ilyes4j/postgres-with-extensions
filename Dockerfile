FROM postgres:16.4

RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/pgaudit/pgaudit.git && \
    cd pgaudit && \
    git checkout REL_16_STABLE && \
    apt-get remove -y git && \
    apt-get install -y postgresql-server-dev-16 &&\
    apt-get install -y libkrb5-dev && \
    apt-get install -y build-essential && \
    make install USE_PGXS=1 PG_CONFIG=/usr/lib/postgresql/16/bin/pg_config && \
    apt-get remove -y build-essential && \
    apt-get remove -y libkrb5-dev && \
    apt-get remove -y postgresql-server-dev-16 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y
