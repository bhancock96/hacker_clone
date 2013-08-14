get '/post/new' do
  erb :new_post
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  erb :post
end

get '/post/:id/edit' do
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  if @user.id == session[:user_id]
    erb :edit_post
  else
    erb :login
  end
end

get '/post/:id/delete' do
  @user = User.find(session[:user_id])
  @post = Post.find(params[:id])
  @post.destroy
  redirect "/user/#{@user.id}"
end

post '/post/new' do
  @user = User.find(session[:user_id])
  post = Post.create(params[:post])
  @user.posts << post
  redirect "/post/#{post.id}"
end

post '/post/:id/comment' do
  @post = Post.find(params[:id])
  @post.comments << Comment.create(body: params[:comment][:body], 
                                   user_id: session[:user_id])
  redirect "post/#{@post.id}"
end


post '/post/:id/edit' do
  
  @post = Post.find(params[:id])
  @post.update_attributes(title: params[:post][:title],
                          body: params[:post][:body])
  # @user.posts << post
  redirect "/post/#{@post.id}"
end


