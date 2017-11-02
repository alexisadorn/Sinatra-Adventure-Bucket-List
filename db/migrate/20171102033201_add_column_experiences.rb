class AddColumnExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :country, :string
  end
end
