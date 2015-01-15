require 'sinatra'
require 'sinatra/partial'
require 'instagram'
require 'dotenv'

require_relative 'controllers/application'
require_relative 'controllers/oauth'
require_relative 'controllers/nav'
Dotenv.load

set :partial_template_engine, :erb
set :public_folder, Proc.new { File.join(root, '..', 'public') }

enable :sessions

CALLBACK_URL = "http://localhost:9292/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV['INSTA_CLIENT_ID']
  config.client_secret = ENV['INSTA_CLIENT_SECRET']
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end

get "/user_recent_media" do
  @client = Instagram.client(:access_token => session[:access_token])
  @user = @client.user
  erb :user_recent_media
end