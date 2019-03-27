class Item < ActiveRecord::Base
    has_many :facilities, through: :facility_items
end
