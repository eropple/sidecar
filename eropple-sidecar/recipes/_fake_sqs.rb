include_recipe "#{cookbook_name}::_ruby"

bash "installing-fake_sqs" do
  code <<-BASH
    scl enable rh-ruby24 "gem install fake_sqs"
  BASH
end

dir = "/srv/fake_sqs"
directory dir

poise_service "fake_sqs" do
  action %i[enable start]
  command "/bin/scl enable rh-ruby24 'fake_sqs --database #{dir}/data.yml'"
end
