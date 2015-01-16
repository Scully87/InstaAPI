get "/recent_feed" do
  @client = Instagram.client(:access_token => session[:access_token])
  @user = @client.user
  @page_1 = @client.user_media_feed(777)
  @page_2_max_id = @page_1.pagination.next_max_id
  @page_2 = @client.user_recent_media(777, :max_id => @page_2_max_id ) unless @page_2_max_id.nil?
  erb :recent_feed
end