class Bill < ApplicationRecord
  has_one  :procedure
  has_many :items
  has_one  :facility
end

