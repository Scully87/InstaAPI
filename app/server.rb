require 'sinatra'
require 'sinatra/partial'
require 'instagram'
require 'dotenv'
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

get "/" do
  '<a href="/oauth/connect">Connect with Instagram</a>'
end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/nav"
end