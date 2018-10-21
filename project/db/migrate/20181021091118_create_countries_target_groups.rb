class CreateCountriesTargetGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :countries_target_groups do |t|
      t.belongs_to :country, foreign_key: true
      t.belongs_to :target_group, foreign_key: true
      t.index [:country_id, :target_group_id], unique: true, name: "index_countries_target_groups_on_country_and_target_group"
    end
  end
end
