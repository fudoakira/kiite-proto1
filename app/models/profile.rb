class Profile < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :nickname, presence: true
end
