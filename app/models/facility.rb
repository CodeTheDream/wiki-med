class Facility < ActiveRecord::Base
    belongs_to :item
    belongs_to :procedure
end
