class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.belongs_to :comment
      t.belongs_to :user
      t.integer :vote, default: 0
      t.timestamps
    end
  end
end
