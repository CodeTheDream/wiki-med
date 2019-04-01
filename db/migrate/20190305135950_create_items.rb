class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.date :date
      t.string :description
      t.float :price
      t.string :status
      t.integer :facility_id
      t.timestamps null: false
    end
  end
end
