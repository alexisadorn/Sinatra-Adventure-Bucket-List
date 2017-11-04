class CountryCategory < ActiveRecord::Base
  belongs_to :country
  belongs_to :category
end
