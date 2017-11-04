class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :experience_categories
  has_many :categories, through: :experience_categories
end
