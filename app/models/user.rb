class User < ApplicationRecord

  has_many :comments, dependent: :destroy

  self.whitelisted_columns = %i[ id first_name last_name image_path ]

end
