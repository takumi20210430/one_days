class Dog < ApplicationRecord
  
  validates :name, {presence: true}

  belongs_to :user

  attachment :image1
  attachment :image2
  attachment :image3

  enum dog_type_id: { ポメラニアン系: 0, プードル系: 1, ブルドック系: 2, 柴犬系: 3, チワワ系: 4, ダックスフンド系: 5, パピヨン: 6,
    ヨークシャテリア: 7, マルチーズ: 8, シーズー: 9, コーギー: 10, レトリバー系: 11, シュナウザー系: 12, ペキニーズ: 13, ボルゾイ: 14,
    アピンシャー系: 15, ビションフリーゼ: 16, ボストンテリア: 17, グレートピレニーズ: 18, グレーハウンド系: 19, セッター系: 20, シベリアンハスキー: 21,
    セントバーナード: 22, チャウチャウ: 23, ダルメシアン: 24, ドーベルマン: 25, サルーキ: 26, ラフコリー: 27, ボクサー: 28, ワイマラナー: 29, シープドック系: 30 }


  def self.looks(searches, words)
    dogs = []

        if searches == "perfect_match"
          Dog.where("name LIKE ?", "#{words}")
        elsif searches == "forward_match"
          Dog.where("name LIKE ?", "#{words}%")
        elsif searches == "backword_match"
          Dog.where("name LIKE ?", "%#{words}")
        else
          dog_type_ids.each do |type_id|
            if type_id[0].include?(words)
              temp_dogs = Dog.where("name LIKE ? OR dog_type_id LIKE ?", "%#{words}%","%#{type_id[1]}%")
              temp_dogs.each do |temp_dog|
                dogs.push(temp_dog)
              end
          end
        end
      dogs
    end
  end


end