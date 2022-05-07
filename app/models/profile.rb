class Profile < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :profile_tags, dependent: :destroy
  has_many :tags, through: :profile_tags
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :nickname, presence: true

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_profile_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_profile_tag
    end
  end
end
