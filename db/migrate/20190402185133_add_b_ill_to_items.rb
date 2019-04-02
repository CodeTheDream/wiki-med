class AddBIllToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :bills, foreign_key: true	  
  end
end
