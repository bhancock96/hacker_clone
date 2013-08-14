class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :post, :user

  def self.find_or_create(attributes)
    PostVote.where(attributes).first || PostVote.create(attributes)
  end

  def upvote
    self.vote = 1
    self.save
  end

  def downvote
    self.vote = -1
    self.save
  end

  def unvote
    self.vote = 0
    self.save
  end

end
