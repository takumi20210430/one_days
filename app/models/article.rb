class Article < ApplicationRecord

  validates :title, presence: true,length: { maximum: 30 }
  validates :body, presence: true,length: { maximum: 1000 }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :article_comments, dependent: :destroy

  attachment :image1
  attachment :image2
  attachment :image3
  attachment :image4
  attachment :image5

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.create_all_ranks #articleクラスからデータを取ってくる処理なのでクラスメソッド！
    Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(10).pluck(:article_id))
  end

  def self.looks(searches, words)
    if searches == "perfect_match"
      @article = Article.where("title LIKE ?", "#{words}")
    elsif searches == "forward_match"
      @article = Article.where("title LIKE ?", "#{words}%")
    elsif searches == "backword_match"
      @article = Article.where("title LIKE ?", "%#{words}")
    else
      @article = Article.where("title LIKE ?", "%#{words}%")
    end
  end


end
