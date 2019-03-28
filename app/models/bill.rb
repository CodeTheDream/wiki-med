class Bill < ActiveRecord::Base
  has_many :items
  #nested attributes
  accepts_nested_attributes_for :items, allow_destroy: true
  has_many :procedures
end

