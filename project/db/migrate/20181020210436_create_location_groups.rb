class CreateLocationGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :location_groups do |t|
      t.string :name, null: false
      t.belongs_to :country, foreign_key: true, null: false
      t.belongs_to :panel_provider, foreign_key: true, null: false

      t.timestamps
    end
  end
end
