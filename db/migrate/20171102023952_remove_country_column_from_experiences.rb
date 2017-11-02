class RemoveCountryColumnFromExperiences < ActiveRecord::Migration[5.1]
  def change
    remove_column :experiences, :country_id
  end
end
