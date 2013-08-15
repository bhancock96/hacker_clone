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
  vote = CommentVote.find_or_create(user_id: session[:user_id],
                                    comment_id: params[:id])
  vote.upvote
  post_id = Comment.find(params[:id]).post_id
  redirect "/post/#{post_id}"
end

post '/comment/:id/downvote' do
  vote = CommentVote.find_or_create(user_id: session[:user_id],
                                    comment_id: params[:id])
  vote.downvote

  post_id = Comment.find(params[:id]).post_id
  redirect "/post/#{post_id}"
end
