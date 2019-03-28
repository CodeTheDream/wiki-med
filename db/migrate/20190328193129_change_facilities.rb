class ChangeFacilities < ActiveRecord::Migration[5.2]
  def up
    add_column :facilities, :street, :string	  
  end
end
