class ChangeBills < ActiveRecord::Migration[5.2]
  def up
    add_column :bills, :facility_id, :integer
  end
end
