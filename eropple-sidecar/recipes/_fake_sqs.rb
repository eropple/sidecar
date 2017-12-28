include_recipe "#{cookbook_name}::_ruby"

bash "installing-fakes3" do
  code <<-BASH
    scl enable rh-ruby24 "gem install fake_sqs"
  BASH
end

user "fake_sqs"

dir = "/srv/fake_sqs"
directory dir do
  owner "fake_sqs"
end

poise_service "fake_sqs" do
  user "fake_sqs"

  action %i[enable start]
  command "/bin/scl enable rh-ruby24 'fake_sqs --database /srv/fake_sqs/data.yml'"
end
