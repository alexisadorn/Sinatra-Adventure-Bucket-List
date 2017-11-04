class CreateCountryCategoriesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :country_categories do |t|
      t.integer :country_id
      t.integer :category_id
    end
  end
end
