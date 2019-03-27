class Facility < ActiveRecord::Base
    has_many :facility_items
    has_many :facility_procedures
    has_many :items, through: :facility_items
    has_many :procedures, through: :facility_procedures
end
