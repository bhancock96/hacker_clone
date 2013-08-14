colleen = User.create(name: "Colleen", email: "c@dbc.com", password: "hello", password_confirmation: "hello")
bryan = User.create(name: "Bryan", email: "b@dbc.com", password: "hello", password_confirmation: "hello")

@post = Post.create(title: "Colleen post", body: "post contenttttttt!!!!!!!!!!", user_id: colleen.id)
3.times do
  @post.comments << Comment.create(body: "Some great comments", user_id: bryan.id)
end


3.times do
  user = User.create( name: Faker::Internet.user_name, 
                      email: Faker::Internet.email, 
                      password: "password", 
                      password_confirmation: "password")
  
  10.times do
    @post = Post.create( title: Faker::Lorem.sentence(word_count=3), 
                         body: Faker::Lorem.paragraphs(paragraph_count=1), 
                         user_id: user.id)
    3.times do
      @post.comments << Comment.create( body: Faker::Lorem.paragraphs(paragraph_count=1))
    end
  end
end
