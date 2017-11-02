class User < ActiveRecord::Base
  has_many :experiences
  has_many :categories, through: :experiences
  has_secure_password
end
