yum_package "rh-postgresql96"

bash "initialize rh-postgresql96" do
  code <<-BASH
    . /opt/rh/rh-postgresql96/enable

    postgresql-setup --initdb
    grep "listen_addresses = '0.0.0.0'" /var/opt/rh/rh-postgresql96/lib/pgsql/data/postgresql.conf || echo "listen_addresses = '0.0.0.0'" >> /var/opt/rh/rh-postgresql96/lib/pgsql/data/postgresql.conf
    grep '0.0.0.0/0' /var/opt/rh/rh-postgresql96/lib/pgsql/data/pg_hba.conf || echo "host all all 0.0.0.0/0 md5" >> /var/opt/rh/rh-postgresql96/lib/pgsql/data/pg_hba.conf

  BASH
end

service "rh-postgresql96-postgresql" do
  action %i[enable start]
end

bash "set postgres user password to postgres" do
  code <<-BASH
    sudo -i -u postgres bash -c ". /opt/rh/rh-postgresql96/enable && psql -c \\"ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres';\\""
  BASH
end
