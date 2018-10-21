class RemoveIndexOnExternalIdInLocations < ActiveRecord::Migration[5.2]
  def change
    remove_index :locations, column: :external_id, unique: true
  end
end
