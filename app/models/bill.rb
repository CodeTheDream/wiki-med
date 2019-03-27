class Bill < ActiveRecord::Base
  has_many :items
  #nested attributes
  accepts_nested_attributes_for :items
  has_many :procedures
end

