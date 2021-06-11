class Article < ApplicationRecord

  belongs_to :user



   attachment :image1
   attachment :image2
   attachment :image3
   attachment :image4
   attachment :image5

end
