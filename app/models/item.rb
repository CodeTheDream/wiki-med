class Item < ActiveRecord::Base
    has_one :facilities, :foreign_key => "facility_id"
end
