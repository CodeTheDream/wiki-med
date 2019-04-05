class Bill < ApplicationRecord
  belongs_to  :procedure
  has_many :items
  belongs_to  :facility
end

