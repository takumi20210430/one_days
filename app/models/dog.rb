class Dog < ApplicationRecord

  belongs_to :user
  belongs_to :dog_type
  
  attachment :image

end
