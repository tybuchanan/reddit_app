class AddUpvoteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :upvote, :integer
    add_column :posts, :downvote, :integer
  end
end
