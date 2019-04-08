class Bill < ActiveRecord::Base
  belongs_to  :procedure
  has_many :items
  belongs_to  :facility
end

#This file has applicationRecord instead of ActiveRecord:: Base 