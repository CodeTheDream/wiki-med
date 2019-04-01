class ChangeItems < ActiveRecord::Migration[5.2]
  def down
    remove_column :items, :date
    remove_column :items, :status
    remove_column :items, :facility_id
  end

  def up
    add_foreign_key :items, :bills
  end
end
