bash "yum groupinstall 'Development Tools'"

include_recipe 'build-essential::default'
include_recipe 'yum-epel'
include_recipe 'yum-scl'
