get "/recent_uploads" do
  @client = Instagram.client(:access_token => session[:access_token])
  @user = @client.user
  erb :recent_uploads
end