class Bill < ApplicationRecord
  has_one  :procedure, foreign_key: :procedure_id
  has_many :items
  has_one  :facility, foreign_key: :facility_id
end

