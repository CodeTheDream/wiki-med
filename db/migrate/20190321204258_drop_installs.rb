class DropInstalls < ActiveRecord::Migration[5.2]
  def change
    ##Used to Drop former tables, doing a schema change to a one to many relationship.
    ##Previous had a many to many but the specific procedure can only be done at one hospital
     drop_table :facility_procedures
     drop_table :facility_items
  end
end
