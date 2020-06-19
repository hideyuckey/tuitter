class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :image, ImageUploader
  mount_uploader :icon, ImageUploader


  def like?(user, tweet)
    @like = Like.find_by(user_id: user.id, tweet_id: tweet.id)
    if @like.present?
      return true
    else
      return false
    end
  end

end
