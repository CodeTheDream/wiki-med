class AddBillIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :bill_id, :integer	  
  end
end
