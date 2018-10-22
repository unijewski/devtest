class CreateLocationsLocationGroupsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :locations, :location_groups do |t|
      t.index :location_id
      t.index :location_group_id
      t.index [:location_id, :location_group_id], unique: true, name: "index_locations_location_groups_on_location_and_location_group"
    end
  end
end
