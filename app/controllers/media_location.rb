get "/media_location" do
  @client = Instagram.client(:access_token => session[:access_token])
  erb :media_location
end