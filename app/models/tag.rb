class Tag < ApplicationRecord
  has_many :profile_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :tags, through: :profile_tags
end
