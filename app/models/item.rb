class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :price
    validates :quantity_id

    validates :image
  end

    validates :size_id, numericality: { other_than: 1, message: "can't be blank" } 

  belongs_to :user
end
