class Bill < ApplicationRecord
   has_many :items
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
  #nested attributes
  belongs_to :procedure
  belongs_to :facility
end

