class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, {presence: true}

         has_many :dogs, dependent: :destroy
         has_many :articles, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :article_comments, dependent: :destroy
         has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
         has_many :followings, through: :active_relationships, source: :follower
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :followers, through: :passive_relationships, source: :following


         attachment :image

        def followed_by?(user)
          passive_relationships.find_by(following_id: user.id).present?
        end



        def self.looks(searches, words)
          if searches == "perfect_match"
            @user = User.where("name LIKE ?", "#{words}")
          elsif searches == "forward_match"
            @user = User.where("name LIKE ?", "#{words}%")
          elsif searches == "backword_match"
            @user = User.where("name LIKE ?", "%#{words}")
          else
            @user = User.where("name LIKE ?", "%#{words}%")
          end
        end



end
