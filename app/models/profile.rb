class Profile < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  validates :nickname, presence: true
end
