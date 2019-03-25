class Facility < ActiveRecord::Base
    has_many :procedures
    has_many :items
end
