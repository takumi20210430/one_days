class Dog < ApplicationRecord

  belongs_to :user


  attachment :image

enum dog_type_id: { ポメラニアン: 0, トイプードル: 1, ブルドック:2, 柴犬:3}


end
