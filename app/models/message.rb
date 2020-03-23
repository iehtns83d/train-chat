class Message < ApplicationRecord
  belongs_to :line
  belongs_to :station
  belongs_to :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
