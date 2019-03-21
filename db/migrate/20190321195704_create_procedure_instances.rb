class CreateProcedureInstances < ActiveRecord::Migration[5.2]
  def change
    create_table :procedure_instances do |t|
      t.integer :procedure_id
      t.float :price
      t.string :status
      t.date :date
      t.integer :facility_id
      t.timestamps  null: false
    end
  end
end
