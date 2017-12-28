include_recipe "#{cookbook_name}::_ruby"

yum_package 'sqlite-devel'

bash "installing-mailcatcher" do
  code <<-BASH
    scl enable rh-ruby24 "gem install mailcatcher"
  BASH
end

user 'mailcatcher' # can't use poise_service_user, expects a home directory
poise_service 'mailcatcher' do
  user 'mailcatcher'
  action %i[enable start]

  command '/bin/scl enable rh-ruby24 "mailcatcher --foreground --ip 0.0.0.0"'
end
