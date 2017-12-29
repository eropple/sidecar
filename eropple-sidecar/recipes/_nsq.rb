poise_archive node['sidecar']['nsq']['url'] do
  destination '/usr/local/bin'

  keep_existing true
  strip_components 2
end

poise_service "nsqlookupd" do
  action %i[enable start]

  command "/usr/local/bin/nsqlookupd"
end

poise_service "nsqd" do
  action %i[enable start]

  command "/usr/local/bin/nsqd --lookupd-tcp-address=127.0.0.1:4160"
end

poise_service "nsqadmin" do
  action %i[enable start]

  command "/usr/local/bin/nsqadmin --lookupd-http-address=127.0.0.1:4161"
end
