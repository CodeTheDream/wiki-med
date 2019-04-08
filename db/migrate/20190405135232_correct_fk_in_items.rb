class CorrectFkInItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :bills_id, :integer
    add_reference :items, :bill, foreign_key: true
  end
end
