class ChangeItems3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :bill_id, :integer
    add_foreign_key :items, :bills
  end
end
