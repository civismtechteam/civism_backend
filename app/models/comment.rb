class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable, dependent: :destroy

  self.whitelisted_columns = %i[ id body num_upvotes num_downvotes num_comments ]

end
