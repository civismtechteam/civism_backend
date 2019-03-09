class Perspective < ApplicationRecord

  belongs_to :scoop
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  self.whitelisted_columns = %i[ body num_upvotes num_downvotes num_comments ]

end
