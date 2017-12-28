include_recipe 'yum-epel'
include_recipe 'yum-scl'

yum_package 'rh-ruby24'
yum_package 'rh-ruby24-ruby-devel'
