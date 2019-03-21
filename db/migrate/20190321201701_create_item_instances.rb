class CreateItemInstances < ActiveRecord::Migration[5.2]
  def change
    create_table :item_instances do |t|
      t.integer :item_id
      t.date :date
      t.float :price
      t.string :status
      t.integer :facility_id
      t.timestamps  null: false
    end
  end
end
