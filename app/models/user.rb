class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :favorites
  has_many :favorite_post_image, through: :favorites, source: :post_image
  has_many :comments, dependent: :destroy
  attachment :profile_image

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def is_sex_text
    if is_sex == true
      "男性"
    else
      "女性"
    end
  end


# 退会機能を実装
	enum is_deleted: { '退会済': true, '会員': false}
  def active_for_authentication?
  	super && (self.is_deleted == '会員')
  end
end
