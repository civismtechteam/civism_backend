class Scoop < ApplicationRecord

  self.whitelisted_columns = %i[ name image_path ]

end
