class Bill < ActiveRecord::Base
  belongs_to  :procedure
  has_many :items
  belongs_to  :facility
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  # humanizer for captcha
  include Humanizer
  require_human_on [:create, :quick_create]


end

#This file has applicationRecord instead of ActiveRecord:: Base 