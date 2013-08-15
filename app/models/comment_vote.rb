class CommentVote < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user

  validates_presence_of :comment, :user

  def self.find_or_create(attributes)
    CommentVote.where(attributes).first || CommentVote.create(attributes)
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
