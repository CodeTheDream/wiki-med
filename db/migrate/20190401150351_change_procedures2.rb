class ChangeProcedures2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :procedures, :date, :date
    remove_column :procedures, :price, :price
    remove_column :procedures, :facility_id, :facility_id
    remove_column :procedures, :status, :status	  
  end
end
