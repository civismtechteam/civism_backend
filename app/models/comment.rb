class Comment < ApplicationRecord

  self.whitelisted_columns = %i[ body num_upvotes num_downvotes num_comments ]

end
