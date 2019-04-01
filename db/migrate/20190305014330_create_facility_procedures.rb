class CreateFacilityProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_procedures do |t|

      t.timestamps null: false
    end
  end
end
