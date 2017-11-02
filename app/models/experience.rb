class Experience < ActiveRecord::Base
  belongs_to :user
  has_many :experience_categories
  has_many :categories, through: :experience_categories
end
