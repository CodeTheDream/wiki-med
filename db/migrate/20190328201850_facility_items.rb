class FacilityItems < ActiveRecord::Migration[5.2]
  def down
    drop_table :facility_items
  end
end
