class PostImage < ApplicationRecord


  validates :image, presence: true
  
	belongs_to :user
	has_many :favorites
  has_many :comments, dependent: :destroy
	attachment :image

	def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end

end
