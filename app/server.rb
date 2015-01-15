require 'sinatra'
require 'sinatra/partial'
require 'instagram'

set :partial_template_engine, :erb
set :public_folder, Proc.new { File.join(root, '..', 'public') }

enable :sessions

CALLBACK_URL = "http://localhost:9292/oauth/callback"

Instagram.configure do |config|
  config.client_id = "INSTA_CLIENT_ID"
  config.client_secret = "INSTA_CLIENT_SECRET"
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end