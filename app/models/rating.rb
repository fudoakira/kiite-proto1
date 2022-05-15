class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  validates :rate, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}

end
