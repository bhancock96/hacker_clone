get '/user/:id' do
  @user = User.find(params[:id])
  if @user.id == session[:user_id]
    erb :profile
  else
    erb :login
  end
end

get '/user/:id/posts' do
  @user = User.find(params[:id])
  
  erb :user_posts
end

get '/user/:id/comments' do
  @user = User.find(params[:id])
  
  erb :user_comments
end

get '/login' do

  erb :login
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


post '/login' do
  @user = User.find_by_email(params[:user][:email])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    redirect "/login"
  end
end


post '/register' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect "/user/#{@user.id}"
end
