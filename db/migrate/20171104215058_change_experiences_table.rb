class ChangeExperiencesTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :experiences, :country, :country_id
    change_column :experiences, :country_id, :integer
  end
end
