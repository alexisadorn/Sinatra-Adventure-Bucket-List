class RemoveRegionColFromCountries < ActiveRecord::Migration[5.1]
  def change
    remove_column :countries, :region
  end
end
