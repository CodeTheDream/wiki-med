class ReretryChangingProcedures < ActiveRecord::Migration[5.2]
  def down
    remove_column :procedures, :date, :date
    remove_column :procedures, :price, :float
    remove_column :procedures, :facility_id, :integer
    remove_column :procedures, :status, :string
  end
end
