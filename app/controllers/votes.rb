post '/post/:id/upvote' do
  vote = PostVote.find_or_create(user_id: session[:user_id],
                                 post_id: params[:id])
  vote.upvote

  redirect '/'
end

post '/post/:id/downvote' do
  vote = PostVote.find_or_create(user_id: session[:user_id],
                                 post_id: params[:id])
  vote.downvote

  redirect '/'
end

post '/comment/:id/upvote' do
end

post '/comment/:id/downvote' do
end
