class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  belongs_to :quantity
  belongs_to :size
end


