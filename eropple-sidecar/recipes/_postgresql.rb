node.default['postgresql']['pg_hba'] <<
  { type: 'host', db: 'all', user: 'all', addr: '0.0.0.0/0', method: 'md5' }

include_recipe "postgresql::default"
include_recipe "postgresql::server"
