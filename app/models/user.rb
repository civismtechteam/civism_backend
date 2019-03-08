class User < ApplicationRecord

  self.whitelisted_columns = %i[ first_name last_name image_path ]

end
