# -*- mode: ruby -*-
# frozen_string_literal: false
# vi: set ft=ruby :

# rubocop:disable Style/MutableConstant

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
