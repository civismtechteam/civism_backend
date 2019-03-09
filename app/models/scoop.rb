class Scoop < ApplicationRecord

  has_many :facts,        dependent: :destroy
  has_many :perspectives, dependent: :destroy
  
  self.whitelisted_columns = %i[ name image_path ]

end
