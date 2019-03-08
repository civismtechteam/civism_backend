class Perspective < ApplicationRecord
  
  belongs_to :scoop
  belongs_to :user

  self.whitelisted_columns = %i[ body num_upvotes num_downvotes num_comments ]

end
