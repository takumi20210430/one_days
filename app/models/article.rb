class Article < ApplicationRecord

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :article_comments, dependent: :destroy


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.create_all_ranks #articleクラスからデータを取ってくる処理なのでクラスメソッド！
    Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
  end



   attachment :image1
   attachment :image2
   attachment :image3
   attachment :image4
   attachment :image5

end
