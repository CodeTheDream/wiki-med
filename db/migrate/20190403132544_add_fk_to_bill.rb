class AddFkToBill < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :procedure_id, :integer	  
    remove_column :items, :facility_id, :integer	  
    add_reference :bills, :facility, foreign_key: true
    add_reference :bills, :procedure, foreign_key: true    
  end
end
