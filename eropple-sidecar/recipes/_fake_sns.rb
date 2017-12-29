include_recipe "#{cookbook_name}::_ruby"

bash "installing-fake_sns" do
  code <<-BASH
    scl enable rh-ruby24 "gem install fake_sns"
  BASH
end

dir = "/srv/fake_sns"
directory dir

poise_service "fake_sns" do
  action %i[enable start]
  command "/bin/scl enable rh-ruby24 'fake_sns -p 4572 --database #{dir}/data.yml'"
end
