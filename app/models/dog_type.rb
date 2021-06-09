class DogType < ApplicationRecord
  
  has_many :dogs,dependent: :destroy
  
end
