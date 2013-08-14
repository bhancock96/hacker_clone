get '/post/:id' do
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  erb :post
end


