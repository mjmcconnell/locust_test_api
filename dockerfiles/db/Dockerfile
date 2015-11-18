FROM ubuntu:14.04
MAINTAINER Mark McConnell <mark@rehabstudio.com>

# build dependencies for postgres
RUN apt-get update

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release of PostgreSQL, ``9.3``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
RUN apt-get -y -q install python-software-properties software-properties-common
RUN apt-get -y -q install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Run the rest of the commands as the ``postgres`` user created by the ``postgres-9.3`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``locust`` with ``locust`` as the password and
# then create a database `locust` owned by the ``locust`` role.
ADD assets/users.sql /opt/venv/users.sql

RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER locust WITH SUPERUSER PASSWORD 'locust';" &&\
    createdb -O locust locust &&\
    psql locust < /opt/venv/users.sql

VOLUME ["/var/lib/postgresql"]

CMD /usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main/ -c config_file=/etc/postgresql/9.3/main/postgresql.conf

# Expose ports.
EXPOSE 5432
