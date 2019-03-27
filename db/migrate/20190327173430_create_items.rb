class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.references :bill , foreign_key: true
      #Needed for nested attributes 
      t.references :item, index: true, foreign_key: true
      t.timestamps
    end
  end
end
