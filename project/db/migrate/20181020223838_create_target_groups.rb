class CreateTargetGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :target_groups do |t|
      t.string :name, null: false
      t.string :external_id, null: false
      t.belongs_to :parent, index: true
      t.string :secret_code, null: false
      t.belongs_to :panel_provider, foreign_key: true, null: false

      t.timestamps
    end
  end
end
