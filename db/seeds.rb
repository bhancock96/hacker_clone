colleen = User.create(name: "Colleen", email: "c@dbc.com", password: "hello", password_confirmation: "hello")

10.times do
  @post = Post.create(title: "Post title w/ comments", body: "This is the body of a post", user_id: colleen.id)
  3.times do
    @post.comments << Comment.create(body: "Here is a comment for this post.")
  end
end
