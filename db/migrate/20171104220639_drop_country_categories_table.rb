class DropCountryCategoriesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :country_categories
  end
end
