class Tweet < ApplicationRecord

  belongs_to :user
  has_many :likes

  mount_uploader :image, ImageUploader

  validates :message_or_image, presence: true
  

  def message_or_image
    message.presence or image.presence
  end

end
