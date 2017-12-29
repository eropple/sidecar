include_recipe 'build-essential::default'

if node["platform_family"] == "rhel"
  bash "yum groupinstall 'Development Tools'"
  include_recipe 'yum-epel'
  include_recipe 'yum-scl'

  yum_package 'vim'
elsif node["platform"] == "ubuntu"
end
