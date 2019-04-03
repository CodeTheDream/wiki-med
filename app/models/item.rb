class Item < ActiveRecord::Base
      belongs_to :bill
    validates :name, :description, :price, presence: true
end
