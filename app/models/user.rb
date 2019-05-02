class User < ApplicationRecord

  has_secure_password

  has_many :comments, dependent: :destroy

  self.whitelisted_columns = %i[ id first_name last_name image_path verified ]

end
