class Dog < ApplicationRecord

  validates :name, presence: true, length: { maximum: 15 }
  validates :skill, length: { maximum: 15 }
  validates :favorite, length: { maximum: 15 }
  validates :introduction, length: { maximum: 150 }

  belongs_to :user

  attachment :image1
  attachment :image2
  attachment :image3

  enum dog_type_id: { ポメラニアン系: 0, プードル系: 1, ブルドック系: 2, 柴犬系: 3, チワワ系: 4, ダックスフンド系: 5, パピヨン: 6,
    ヨークシャテリア: 7, マルチーズ: 8, シーズー: 9, コーギー: 10, レトリバー系: 11, シュナウザー系: 12, ペキニーズ: 13, ボルゾイ: 14,
    アピンシャー系: 15, ビションフリーゼ: 16, ボストンテリア: 17, グレートピレニーズ: 18, グレーハウンド系: 19, セッター系: 20, シベリアンハスキー: 21,
    セントバーナード: 22, チャウチャウ: 23, ダルメシアン: 24, ドーベルマン: 25, サルーキ: 26, ラフコリー: 27, ボクサー: 28, ワイマラナー: 29, シープドック系: 30 }

  enum age: { ０: 0, １: 1, ２: 2, ３: 3, ４: 4, ５: 5, ６: 6, ７: 7, ８: 8, ９: 9, １０: 10, １１: 11, １２: 12, １３: 13, １４: 14, １５: 15, １６: 16,
  １７: 17, １８: 18, １９: 19, ２０: 20, ２１: 21, ２２: 22, ２３: 23, ２４: 24, ２５: 25, ２６: 26, ２７: 27, ２８: 28, ２９: 29, ３０以上: 30
  }

  def self.looks(searches, words)
    if searches == "perfect_match"
      Dog.where("name LIKE ?", "#{words}")
    elsif searches == "forward_match"
      Dog.where("name LIKE ?", "#{words}%")
    elsif searches == "backword_match"
      Dog.where("name LIKE ?", "%#{words}")
    else

      dog_ids = Dog.where("name LIKE ?", "%#{words}%").pluck(:id)
      dog_type_ids.each do |type_id|
        # 'hoge'.include?('') # => trueのためwordsの空チェックをしている
        if words.present? && type_id[0].include?(words)
          Dog.where("dog_type_id = ?", type_id[1]).pluck(:id).each do |dog_id|
            dog_ids << dog_id
          end
        end
      end
      Dog.find(dog_ids.uniq)
    end
  end


end
