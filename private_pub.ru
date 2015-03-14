# Run with: rackup private_pub.ru -s thin -E production
require "bundler/setup"
require "yaml"
require "faye"
require "private_pub"
require ::File.expand_path('../config/environment',  __FILE__)

require ::File.expand_path("../lib/api/faye_users.rb",  __FILE__)
require ::File.expand_path("../lib/faye_extensions/user_auth.rb",  __FILE__)

Faye::WebSocket.load_adapter('thin')

PrivatePub.load_config(File.expand_path("../config/private_pub.yml", __FILE__), ENV["RAILS_ENV"] || "development")

faye_server = PrivatePub.faye_app
faye_server.add_extension(UserAuth.new)

faye_server1 = Faye::RackAdapter.new(:mount => "/faye", :timeout => 45)

FAYE_CLIENT = faye_server1.get_client


faye_server.bind(:unsubscribe) do |client_id|
  Api::FayeUsers::FayeActiveUsers.remove_by_client_id(client_id)
end

run faye_server

