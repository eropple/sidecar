include_recipe "#{cookbook_name}::_ruby"

bash "installing-fakes3" do
  code <<-BASH
    scl enable rh-ruby24 "gem install fakes3"
  BASH
end

user "fakes3" # again, fakes3 wants a $HOME

dir = "/srv/fakes3"
directory dir

poise_service "fakes3" do
  action %i[enable start]
  command "/bin/scl enable rh-ruby24 'fakes3 -r #{dir} -p 4567'"
end
