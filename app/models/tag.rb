class Tag < ApplicationRecord
  has_many :profile_tags, dependent: :destroy
  has_many :profiles, through: :profile_tags
end
