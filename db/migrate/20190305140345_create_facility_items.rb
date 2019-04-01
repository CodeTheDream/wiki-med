class CreateFacilityItems < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_items do |t|
      t.integer :facility_id
      t.integer :item_id
      t.timestamps null: false
    end
  end
end
