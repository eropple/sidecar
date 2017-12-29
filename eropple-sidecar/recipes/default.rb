#
# Cookbook Name:: eropple-sidecar
# Recipe:: default
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "#{cookbook_name}::_disable_selinux"
include_recipe "#{cookbook_name}::_disable_firewall"

include_recipe "#{cookbook_name}::_packages"

include_recipe "#{cookbook_name}::_postgresql"
include_recipe "#{cookbook_name}::_redis"
include_recipe "#{cookbook_name}::_nsq"

include_recipe "#{cookbook_name}::_ruby"
include_recipe "#{cookbook_name}::_python"

include_recipe "#{cookbook_name}::_mailcatcher"
include_recipe "#{cookbook_name}::_fakes3"
include_recipe "#{cookbook_name}::_fake_sqs"
include_recipe "#{cookbook_name}::_fake_sns"
# include_recipe "#{cookbook_name}::_mongodb" # because nobody uses mongodb
