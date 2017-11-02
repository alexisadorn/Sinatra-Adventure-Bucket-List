class CreateExperienceCategoriesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :experience_categories do |t|
      t.integer :experience_id
      t.integer :category_id
    end
  end
end
