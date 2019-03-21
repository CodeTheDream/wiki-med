class ItemInstance < ApplicationRecord
    belongs_to :facility
    belongs_to :item
end
