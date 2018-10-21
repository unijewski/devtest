class ChangeForeignKeysTypeFromIntToBigInt < ActiveRecord::Migration[5.2]
  def up
    change_column :countries, :panel_provider_id, :bigint
    change_column :countries_target_groups, :country_id, :bigint
    change_column :countries_target_groups, :target_group_id, :bigint
    change_column :location_groups, :country_id, :bigint
    change_column :location_groups, :panel_provider_id, :bigint
    change_column :target_groups, :parent_id, :bigint
    change_column :target_groups, :panel_provider_id, :bigint
  end

  def down
    change_column :countries, :panel_provider_id, :integer
    change_column :countries_target_groups, :country_id, :integer
    change_column :countries_target_groups, :target_group_id, :integer
    change_column :location_groups, :country_id, :integer
    change_column :location_groups, :panel_provider_id, :integer
    change_column :target_groups, :parent_id, :integer
    change_column :target_groups, :panel_provider_id, :integer
  end
end
