class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.date :date
      t.float :price, :precision => 2, :default => 0.00
      t.integer :procedure_id
      t.string :status
      t.timestamps
    end
  end
end
