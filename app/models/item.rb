class Item < ActiveRecord::Base
  has_one :facility, foreign_key: :facility_id
end
