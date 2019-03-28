class ChangeProcedures < ActiveRecord::Migration[5.2]
  def down
    remove_column :procedures, :date
    remove_column :procedures, :price
    remove_column :procedures, :facility_id
    remove_column :procedures, :status
  end
end
