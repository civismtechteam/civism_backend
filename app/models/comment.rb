class Comment < ApplicationRecord

  include CommentableVoteable

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable, dependent: :destroy

  self.whitelisted_columns = %i[ id user_id body num_upvotes num_downvotes num_comments ]

  after_save do
    commentable.update_comment_count!
  end

end
