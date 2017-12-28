# -*- mode: ruby -*-
# frozen_string_literal: false
# vi: set ft=ruby :

# rubocop:disable Style/MutableConstant

STANDARD_BOOTSTRAP = <<-SH
  apt-get update
  apt-get install -y vim-nox
SH

POSTGRES_BOOTSTRAP = <<-SH
  #Provision PostgreSQL 9.5

  # Install the postgres key
  echo "Importing PostgreSQL key and installing software"
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.5" >> /etc/apt/sources.list.d/pgdg.list
  sudo apt-get update
  sudo apt-get -y install postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5

  echo "Changing to dummy password"
  sudo -u postgres psql postgres -c "ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres'"
  sudo -u postgres psql postgres -c "CREATE EXTENSION adminpack";
  sudo -u postgres createdb testdb -O postgres

  echo "Configuring postgresql.conf"
  sudo echo "listen_addresses = '*'" >> /etc/postgresql/9.5/main/postgresql.conf
  sudo echo "logging_collector = on" >> /etc/postgresql/9.5/main/postgresql.conf

  # Edit to allow socket access, not just local unix access
  echo "Patching pg_hba to change -> socket access"
  sudo echo "host all all all md5" >> /etc/postgresql/9.5/main/pg_hba.conf

  echo "Patching complete, restarting"
  sudo service postgresql restart
SH

MONGODB_BOOTSTRAP = <<-SH
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

  echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
  apt-get update

  apt-get install -y mongodb-org
  sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
  service mongod restart
SH

REDIS_BOOTSTRAP = <<-SH
  add-apt-repository -y ppa:chris-lea/redis-server
  apt-get update

  apt-get install -y redis-server

  sed -i 's/^bind .*/#&/' /etc/redis/redis.conf
  sed -i 's/^protected-mode .*/protected-mode no/' /etc/redis/redis.conf

  service redis-server restart
SH

MAILCATCHER_BOOTSTRAP = <<-SH
  apt-get install -y software-properties-common build-essential
  apt-get install -y libevent-dev libsqlite3-dev
  apt-add-repository -y ppa:brightbox/ruby-ng
  apt-get update

  apt-get install -y ruby2.4 ruby2.4-dev
  gem install mailcatcher

  (crontab -l ; echo "@reboot /usr/local/bin/mailcatcher --ip 0.0.0.0")| crontab -
  mailcatcher --ip 0.0.0.0
SH

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.4"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.network "private_network", ip: "192.168.183.100"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "#{__dir__}/build/cookbooks"
    chef.version = '12.17'

    chef.add_recipe "eropple-sidecar::default"
  end

  # config.vm.provision :shell, inline: STANDARD_BOOTSTRAP
  # config.vm.provision :shell, inline: POSTGRES_BOOTSTRAP
  # # config.vm.provision :shell, inline: MONGODB_BOOTSTRAP
  # config.vm.provision :shell, inline: REDIS_BOOTSTRAP
  # config.vm.provision :shell, inline: MAILCATCHER_BOOTSTRAP
end
