class Procedure < ActiveRecord::Base
    has_many :facilities_procedures
    has_many :facilities, through: :facilities_procedures #might be facility_procedures
end
