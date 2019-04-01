class ChangeItems2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :date, :date
    remove_column :items, :status, :string
    remove_column :items, :facility_id, :integer
    add_foreign_key :items, :bills, :integer    
  end
end
