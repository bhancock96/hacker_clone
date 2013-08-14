class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates_presence_of :email, :name
  validates_uniqueness_of :email, :name

  has_secure_password
end

  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  # include BCrypt
  # before_save :password
# def password
#   @password ||= BCrypt::Password.new(password_digest)
# end

# def password=(new_password)
#   @password = BCrypt::Password.create(new_password)
#   self.password_digest = @password
# end

# def self.authenticate(email, password)
#   @user = User.find_by_email(email)
#   if @user && @user.password == password
#     return @user
#   else
#     return nil
#   end
# end
