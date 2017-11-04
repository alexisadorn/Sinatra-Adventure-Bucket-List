class CreateCountriesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :region
    end
  end
end
