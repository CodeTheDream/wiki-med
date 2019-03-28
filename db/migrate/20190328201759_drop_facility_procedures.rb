class DropFacilityProcedures < ActiveRecord::Migration[5.2]
  def down
    drop_table :facility_procedures
  end
end
