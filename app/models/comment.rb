class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  self.whitelisted_columns = %i[ body num_upvotes num_downvotes num_comments ]

end
