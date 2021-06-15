class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :dogs, dependent: :destroy
         has_many :articles, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :article_comments, dependent: :destroy
         has_many :active_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
         has_many :followings, through: :active_relationships, source: :follower
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :followers, through: :passive_relationships, source: :following


         attachment :image

         enum is_deleted: {Available: false, Invalid: true}

        def followed_by?(user)
          passive_relationships.find_by(following_id: user.id).present?
        end


end
