class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  def num_votes
    @votes = PostVote.where("post_id = ?", self.id)
    # return @votes.vote.inject(:+)
    sum = 0
    @votes.each do |vote|
      sum += vote.vote
    end
    sum
  end
  
end
