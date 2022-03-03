class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  has_one :quantity
  has_one :size
end


