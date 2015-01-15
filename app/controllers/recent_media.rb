get "/user_recent_media" do
  @client = Instagram.client(:access_token => session[:access_token])
  @user = @client.user
  erb :user_recent_media
end