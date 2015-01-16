get '/media_like/:id' do
  @client = Instagram.client(:access_token => session[:access_token])
  @client.like_media("#{params[:id]}")
  redirect "/user_recent_media"
end
